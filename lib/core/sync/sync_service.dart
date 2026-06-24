import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:skillhub/core/local/app_database.dart';
import 'package:skillhub/core/network/api_client.dart';
import 'package:skillhub/core/network/api_exception.dart';
import 'package:skillhub/core/sync/connectivity_service.dart';
import 'package:skillhub/core/sync/session_service.dart';

class SyncService {
  SyncService({
    AppDatabase? database,
    ApiClient? apiClient,
    ConnectivityService? connectivityService,
    SessionService? sessionService,
  }) : _database = database ?? AppDatabase.instance,
       _apiClient = apiClient ?? ApiClient(),
       _connectivityService = connectivityService ?? ConnectivityService(),
       _sessionService = sessionService ?? SessionService(database: database);

  static const _syncOrder = <String, int>{
    'players': 0,
    'subscriptions': 1,
    'evaluations': 2,
    'finance_transactions': 3,
    'messages': 4,
    'notifications': 5,
  };

  final AppDatabase _database;
  final ApiClient _apiClient;
  final ConnectivityService _connectivityService;
  final SessionService _sessionService;

  Future<void> syncNow() async {
    final session = await _sessionService.readLastSession();
    if (session == null || session.isExpired) {
      throw const ApiException('يلزم تسجيل الدخول عبر الإنترنت أولًا.');
    }
    if (!await _connectivityService.hasNetworkConnection()) {
      throw const ApiException('لا يوجد اتصال بالإنترنت.');
    }

    await _verifyServerSession();
    await _pushPending(session);
    await pullSnapshot(session);
  }

  Future<int> pendingCount(String userId) {
    final count = _database.syncOutbox.id.count();
    final query = _database.selectOnly(_database.syncOutbox)
      ..addColumns([count])
      ..where(_database.syncOutbox.userId.equals(userId))
      ..where(_database.syncOutbox.status.isIn(['pending', 'failed']));
    return query.map((row) => row.read(count) ?? 0).getSingle();
  }

  Future<String?> lastSyncError(String userId) async {
    final row =
        await (_database.select(_database.syncOutbox)
              ..where((table) => table.userId.equals(userId))
              ..where((table) => table.lastError.isNotNull())
              ..orderBy([
                (table) => OrderingTerm(
                  expression: table.updatedAt,
                  mode: OrderingMode.desc,
                ),
              ])
              ..limit(1))
            .getSingleOrNull();
    return row?.lastError;
  }

  Future<void> _verifyServerSession() async {
    try {
      await _apiClient.get('/health');
      await _apiClient.get('/auth/me');
    } on ApiException catch (error) {
      if (error.statusCode == 401 || error.statusCode == 403) {
        await _sessionService.clearCurrentAccount();
      }
      rethrow;
    }
  }

  Future<void> _pushPending(LocalSession session) async {
    final pending =
        await (_database.select(_database.syncOutbox)
              ..where((table) => table.userId.equals(session.userId))
              ..where((table) => table.status.isIn(['pending', 'failed']))
              ..orderBy([
                (table) => OrderingTerm(
                  expression: table.createdAt,
                  mode: OrderingMode.asc,
                ),
              ]))
            .get();
    pending.sort((a, b) {
      final entityCompare = (_syncOrder[a.entityType] ?? 99).compareTo(
        _syncOrder[b.entityType] ?? 99,
      );
      return entityCompare == 0
          ? a.createdAt.compareTo(b.createdAt)
          : entityCompare;
    });

    for (final operation in pending) {
      await _runOperation(operation);
    }
  }

  Future<void> _runOperation(SyncOutboxData operation) async {
    final now = DateTime.now();
    await (_database.update(
      _database.syncOutbox,
    )..where((table) => table.id.equals(operation.id))).write(
      SyncOutboxCompanion(
        status: const Value('running'),
        updatedAt: Value(now),
      ),
    );

    try {
      final payload = await _payloadWithServerMappings(operation);
      final response = await _sendOperation(operation, payload);
      await _storeServerMappingIfNeeded(operation, response);
      await _markOperationSynced(operation);
    } on ApiException catch (error) {
      await _markOperationFailed(operation, error.message, error.statusCode);
    } catch (error) {
      await _markOperationFailed(operation, error.toString(), null);
    }
  }

  Future<Map<String, dynamic>> _payloadWithServerMappings(
    SyncOutboxData operation,
  ) async {
    final payload = Map<String, dynamic>.from(
      jsonDecode(operation.payloadJson) as Map,
    );
    final playerId = payload['playerId']?.toString();
    if (playerId != null && playerId.isNotEmpty) {
      final mapping =
          await (_database.select(_database.entityMappings)
                ..where((table) => table.userId.equals(operation.userId))
                ..where((table) => table.entityType.equals('players'))
                ..where((table) => table.localId.equals(playerId)))
              .getSingleOrNull();
      if (mapping != null) {
        payload['playerId'] = mapping.serverId;
      }
    }
    return payload;
  }

  Future<dynamic> _sendOperation(
    SyncOutboxData operation,
    Map<String, dynamic> payload,
  ) {
    final path = _pathFor(operation, payload);
    return switch (operation.action) {
      'create' => _apiClient.post(
        path,
        payload,
        idempotencyKey: operation.idempotencyKey,
      ),
      'update' => _apiClient.put(
        path,
        payload,
        idempotencyKey: operation.idempotencyKey,
      ),
      'delete' => _apiClient.delete(
        path,
        idempotencyKey: operation.idempotencyKey,
      ),
      'mark_read' => _apiClient.patch(path, null, operation.idempotencyKey),
      _ => throw ApiException('عملية مزامنة غير مدعومة: ${operation.action}'),
    };
  }

  String _pathFor(SyncOutboxData operation, Map<String, dynamic> payload) {
    final serverId =
        operation.entityServerId ?? payload['serverId']?.toString();
    return switch (operation.entityType) {
      'players' =>
        operation.action == 'create'
            ? '/players'
            : '/players/${serverId ?? operation.entityLocalId}',
      'subscriptions' =>
        operation.action == 'create'
            ? '/subscriptions'
            : '/subscriptions/${serverId ?? operation.entityLocalId}',
      'evaluations' =>
        operation.action == 'create'
            ? '/evaluations'
            : '/evaluations/${serverId ?? operation.entityLocalId}',
      'finance_transactions' =>
        operation.action == 'create'
            ? '/finance/transactions'
            : '/finance/transactions/${serverId ?? operation.entityLocalId}',
      'messages' =>
        operation.action == 'create'
            ? '/messages'
            : '/messages/${serverId ?? operation.entityLocalId}',
      'notifications' =>
        operation.action == 'mark_read'
            ? '/notifications/${serverId ?? operation.entityLocalId}/read'
            : '/notifications/${serverId ?? operation.entityLocalId}',
      _ => throw ApiException('نوع كيان غير مدعوم: ${operation.entityType}'),
    };
  }

  Future<void> _storeServerMappingIfNeeded(
    SyncOutboxData operation,
    dynamic response,
  ) async {
    if (operation.action != 'create' || response is! Map<String, dynamic>) {
      return;
    }
    final serverId = response['id']?.toString();
    if (serverId == null || serverId.isEmpty) {
      return;
    }
    final now = DateTime.now();
    await _database
        .into(_database.entityMappings)
        .insertOnConflictUpdate(
          EntityMappingsCompanion.insert(
            id: '${operation.entityType}:${operation.entityLocalId}',
            tenantId: Value(operation.tenantId),
            academyId: Value(operation.academyId),
            ownerId: operation.ownerId,
            userId: operation.userId,
            entityType: operation.entityType,
            localId: operation.entityLocalId,
            serverId: serverId,
            createdAt: now,
            updatedAt: now,
          ),
        );
    await _markEntitySynced(operation, serverId);
    await _updateDependentPlayerReferences(operation, serverId);
  }

  Future<void> _updateDependentPlayerReferences(
    SyncOutboxData operation,
    String serverId,
  ) async {
    if (operation.entityType != 'players') {
      return;
    }
    final pending =
        await (_database.select(_database.syncOutbox)
              ..where((table) => table.userId.equals(operation.userId))
              ..where((table) => table.status.isIn(['pending', 'failed']))
              ..where((table) => table.payloadJson.like('%"playerId"%')))
            .get();
    for (final item in pending) {
      final payload = Map<String, dynamic>.from(
        jsonDecode(item.payloadJson) as Map,
      );
      if (payload['playerId']?.toString() != operation.entityLocalId) {
        continue;
      }
      payload['playerId'] = serverId;
      await (_database.update(
        _database.syncOutbox,
      )..where((table) => table.id.equals(item.id))).write(
        SyncOutboxCompanion(
          payloadJson: Value(jsonEncode(payload)),
          updatedAt: Value(DateTime.now()),
        ),
      );
    }
  }

  Future<void> _markOperationSynced(SyncOutboxData operation) async {
    await (_database.update(
      _database.syncOutbox,
    )..where((table) => table.id.equals(operation.id))).write(
      SyncOutboxCompanion(
        status: const Value('synced'),
        lastError: const Value(null),
        updatedAt: Value(DateTime.now()),
      ),
    );
    await _markEntitySynced(operation, operation.entityServerId);
  }

  Future<void> _markOperationFailed(
    SyncOutboxData operation,
    String message,
    int? statusCode,
  ) async {
    final failedStatus =
        statusCode != null && statusCode >= 400 && statusCode < 500
        ? 'conflict'
        : 'failed';
    await (_database.update(
      _database.syncOutbox,
    )..where((table) => table.id.equals(operation.id))).write(
      SyncOutboxCompanion(
        status: Value(failedStatus),
        retryCount: Value(operation.retryCount + 1),
        lastError: Value(message),
        updatedAt: Value(DateTime.now()),
      ),
    );
    await _markEntityFailed(operation, message, failedStatus);
  }

  Future<void> _markEntitySynced(
    SyncOutboxData operation,
    String? serverId,
  ) async {
    final statusUpdate = Value('synced');
    final Value<String?> serverIdUpdate = serverId == null
        ? const Value.absent()
        : Value(serverId);
    final errorUpdate = const Value<String?>(null);
    switch (operation.entityType) {
      case 'players':
        await (_database.update(_database.localPlayers)
              ..where((table) => table.localId.equals(operation.entityLocalId)))
            .write(
              LocalPlayersCompanion(
                serverId: serverIdUpdate,
                syncStatus: statusUpdate,
                lastSyncError: errorUpdate,
                updatedAt: Value(DateTime.now()),
              ),
            );
      case 'subscriptions':
        await (_database.update(_database.localSubscriptions)
              ..where((table) => table.localId.equals(operation.entityLocalId)))
            .write(
              LocalSubscriptionsCompanion(
                serverId: serverIdUpdate,
                syncStatus: statusUpdate,
                lastSyncError: errorUpdate,
                updatedAt: Value(DateTime.now()),
              ),
            );
      case 'evaluations':
        await (_database.update(_database.localEvaluations)
              ..where((table) => table.localId.equals(operation.entityLocalId)))
            .write(
              LocalEvaluationsCompanion(
                serverId: serverIdUpdate,
                syncStatus: statusUpdate,
                lastSyncError: errorUpdate,
                updatedAt: Value(DateTime.now()),
              ),
            );
      case 'finance_transactions':
        await (_database.update(_database.localFinanceTransactions)
              ..where((table) => table.localId.equals(operation.entityLocalId)))
            .write(
              LocalFinanceTransactionsCompanion(
                serverId: serverIdUpdate,
                syncStatus: statusUpdate,
                lastSyncError: errorUpdate,
                updatedAt: Value(DateTime.now()),
              ),
            );
      case 'messages':
        await (_database.update(_database.localMessages)
              ..where((table) => table.localId.equals(operation.entityLocalId)))
            .write(
              LocalMessagesCompanion(
                serverId: serverIdUpdate,
                syncStatus: statusUpdate,
                lastSyncError: errorUpdate,
                updatedAt: Value(DateTime.now()),
              ),
            );
      case 'notifications':
        await (_database.update(_database.localNotifications)
              ..where((table) => table.localId.equals(operation.entityLocalId)))
            .write(
              LocalNotificationsCompanion(
                serverId: serverIdUpdate,
                syncStatus: statusUpdate,
                lastSyncError: errorUpdate,
                updatedAt: Value(DateTime.now()),
              ),
            );
    }
  }

  Future<void> _markEntityFailed(
    SyncOutboxData operation,
    String message,
    String status,
  ) async {
    final updateStatus = Value(status);
    final updateError = Value(message);
    switch (operation.entityType) {
      case 'players':
        await (_database.update(_database.localPlayers)
              ..where((table) => table.localId.equals(operation.entityLocalId)))
            .write(
              LocalPlayersCompanion(
                syncStatus: updateStatus,
                lastSyncError: updateError,
              ),
            );
      case 'subscriptions':
        await (_database.update(_database.localSubscriptions)
              ..where((table) => table.localId.equals(operation.entityLocalId)))
            .write(
              LocalSubscriptionsCompanion(
                syncStatus: updateStatus,
                lastSyncError: updateError,
              ),
            );
      case 'evaluations':
        await (_database.update(_database.localEvaluations)
              ..where((table) => table.localId.equals(operation.entityLocalId)))
            .write(
              LocalEvaluationsCompanion(
                syncStatus: updateStatus,
                lastSyncError: updateError,
              ),
            );
      case 'finance_transactions':
        await (_database.update(_database.localFinanceTransactions)
              ..where((table) => table.localId.equals(operation.entityLocalId)))
            .write(
              LocalFinanceTransactionsCompanion(
                syncStatus: updateStatus,
                lastSyncError: updateError,
              ),
            );
      case 'messages':
        await (_database.update(_database.localMessages)
              ..where((table) => table.localId.equals(operation.entityLocalId)))
            .write(
              LocalMessagesCompanion(
                syncStatus: updateStatus,
                lastSyncError: updateError,
              ),
            );
      case 'notifications':
        await (_database.update(_database.localNotifications)
              ..where((table) => table.localId.equals(operation.entityLocalId)))
            .write(
              LocalNotificationsCompanion(
                syncStatus: updateStatus,
                lastSyncError: updateError,
              ),
            );
    }
  }

  Future<void> pullSnapshot(LocalSession session) async {
    final response = await _apiClient.get('/sync/snapshot');
    if (response is! Map<String, dynamic>) {
      throw const ApiException('استجابة المزامنة غير صالحة.');
    }
    final now = DateTime.now();
    await _database.transaction(() async {
      await _upsertPlayers(session, response['players'], now);
      await _upsertSubscriptions(session, response['subscriptions'], now);
      await _upsertEvaluations(session, response['evaluations'], now);
      await _upsertFinance(session, response['financeTransactions'], now);
      await _upsertMessages(session, response['messages'], now);
      await _upsertNotifications(session, response['notifications'], now);
      await _database
          .into(_database.syncMeta)
          .insertOnConflictUpdate(
            SyncMetaCompanion.insert(
              ownerId: session.userId,
              userId: session.userId,
              tenantId: Value(session.tenantId),
              academyId: Value(session.academyId),
              lastPulledAt: Value(now),
              serverTime: Value(_date(response['serverTime']) ?? now),
              updatedAt: now,
            ),
          );
    });
  }

  Future<void> _upsertPlayers(
    LocalSession session,
    dynamic items,
    DateTime now,
  ) async {
    for (final json in _maps(items)) {
      final id = json['id']?.toString();
      final birthDate = _date(json['birthDate']);
      if (id == null || birthDate == null) continue;
      final updatedAt = _date(json['updatedAt']) ?? now;
      final existing =
          await (_database.select(_database.localPlayers)
                ..where((table) => table.userId.equals(session.userId))
                ..where(
                  (table) =>
                      table.localId.equals(id) | table.serverId.equals(id),
                ))
              .getSingleOrNull();
      await _database
          .into(_database.localPlayers)
          .insertOnConflictUpdate(
            LocalPlayersCompanion.insert(
              localId: existing?.localId ?? id,
              serverId: Value(id),
              tenantId: Value(session.tenantId),
              academyId: Value(session.academyId),
              ownerId: session.userId,
              userId: session.userId,
              name: json['name']?.toString() ?? '',
              birthDate: birthDate,
              phone: json['phone']?.toString() ?? '',
              guardianName: json['guardianName']?.toString() ?? '',
              guardianRelation: json['guardianRelation']?.toString() ?? '',
              guardianJob: Value(json['guardianJob']?.toString()),
              isActive: Value(json['isActive'] == true),
              createdAt: _date(json['createdAt']) ?? now,
              updatedAt: updatedAt,
              clientUpdatedAt: updatedAt,
              syncStatus: const Value('synced'),
              rawJson: Value(jsonEncode(json)),
            ),
          );
    }
  }

  Future<void> _upsertSubscriptions(
    LocalSession session,
    dynamic items,
    DateTime now,
  ) async {
    for (final json in _maps(items)) {
      final id = json['id']?.toString();
      final startDate = _date(json['startDate']);
      final endDate = _date(json['endDate']);
      if (id == null || startDate == null || endDate == null) continue;
      final updatedAt = _date(json['updatedAt']) ?? now;
      final existing =
          await (_database.select(_database.localSubscriptions)
                ..where((table) => table.userId.equals(session.userId))
                ..where(
                  (table) =>
                      table.localId.equals(id) | table.serverId.equals(id),
                ))
              .getSingleOrNull();
      await _database
          .into(_database.localSubscriptions)
          .insertOnConflictUpdate(
            LocalSubscriptionsCompanion.insert(
              localId: existing?.localId ?? id,
              serverId: Value(id),
              tenantId: Value(session.tenantId),
              academyId: Value(session.academyId),
              ownerId: session.userId,
              userId: session.userId,
              playerLocalId: Value(existing?.playerLocalId),
              playerServerId: Value(json['playerId']?.toString()),
              amount: _double(json['amount']),
              startDate: startDate,
              endDate: endDate,
              notes: Value(json['notes']?.toString()),
              createdAt: _date(json['createdAt']) ?? now,
              updatedAt: updatedAt,
              clientUpdatedAt: updatedAt,
              syncStatus: const Value('synced'),
              rawJson: Value(jsonEncode(json)),
            ),
          );
    }
  }

  Future<void> _upsertEvaluations(
    LocalSession session,
    dynamic items,
    DateTime now,
  ) async {
    for (final json in _maps(items)) {
      final id = json['id']?.toString();
      final evaluationDate = _date(json['evaluationDate']);
      if (id == null || evaluationDate == null) continue;
      final updatedAt = _date(json['updatedAt']) ?? now;
      final existing =
          await (_database.select(_database.localEvaluations)
                ..where((table) => table.userId.equals(session.userId))
                ..where(
                  (table) =>
                      table.localId.equals(id) | table.serverId.equals(id),
                ))
              .getSingleOrNull();
      await _database
          .into(_database.localEvaluations)
          .insertOnConflictUpdate(
            LocalEvaluationsCompanion.insert(
              localId: existing?.localId ?? id,
              serverId: Value(id),
              tenantId: Value(session.tenantId),
              academyId: Value(session.academyId),
              ownerId: session.userId,
              userId: session.userId,
              playerLocalId: Value(existing?.playerLocalId),
              playerServerId: Value(json['playerId']?.toString()),
              coach: json['coach']?.toString() ?? '',
              evaluationDate: evaluationDate,
              fitness: _int(json['fitness']),
              speed: _int(json['speed']),
              skill: _int(json['skill']),
              discipline: _int(json['discipline']),
              teamwork: _int(json['teamwork']),
              notes: Value(json['notes']?.toString() ?? ''),
              createdAt: _date(json['createdAt']) ?? now,
              updatedAt: updatedAt,
              clientUpdatedAt: updatedAt,
              syncStatus: const Value('synced'),
              rawJson: Value(jsonEncode(json)),
            ),
          );
    }
  }

  Future<void> _upsertFinance(
    LocalSession session,
    dynamic items,
    DateTime now,
  ) async {
    for (final json in _maps(items)) {
      final id = json['id']?.toString();
      if (id == null) continue;
      final updatedAt =
          _date(json['updatedAt']) ?? _date(json['createdAt']) ?? now;
      await _database
          .into(_database.localFinanceTransactions)
          .insertOnConflictUpdate(
            LocalFinanceTransactionsCompanion.insert(
              localId: id,
              serverId: Value(id),
              ownerId: session.userId,
              userId: session.userId,
              type: json['type']?.toString() ?? '',
              category: json['category']?.toString() ?? '',
              amount: _double(json['amount']),
              description: json['description']?.toString() ?? '',
              occurredAt: _date(json['occurredAt']) ?? now,
              createdAt: _date(json['createdAt']) ?? now,
              updatedAt: updatedAt,
              clientUpdatedAt: updatedAt,
              syncStatus: const Value('synced'),
              rawJson: Value(jsonEncode(json)),
            ),
          );
    }
  }

  Future<void> _upsertMessages(
    LocalSession session,
    dynamic items,
    DateTime now,
  ) async {
    for (final json in _maps(items)) {
      final id = json['id']?.toString();
      if (id == null) continue;
      final updatedAt =
          _date(json['updatedAt']) ?? _date(json['createdAt']) ?? now;
      await _database
          .into(_database.localMessages)
          .insertOnConflictUpdate(
            LocalMessagesCompanion.insert(
              localId: id,
              serverId: Value(id),
              ownerId: session.userId,
              userId: session.userId,
              playerServerId: Value(json['playerId']?.toString()),
              recipient: json['recipient']?.toString() ?? '',
              channel: json['channel']?.toString() ?? '',
              body: json['body']?.toString() ?? '',
              status: Value(json['status']?.toString() ?? 'pending'),
              scheduledAt: Value(_date(json['scheduledAt'])),
              sentAt: Value(_date(json['sentAt'])),
              createdAt: _date(json['createdAt']) ?? now,
              updatedAt: updatedAt,
              clientUpdatedAt: updatedAt,
              syncStatus: const Value('synced'),
              rawJson: Value(jsonEncode(json)),
            ),
          );
    }
  }

  Future<void> _upsertNotifications(
    LocalSession session,
    dynamic items,
    DateTime now,
  ) async {
    for (final json in _maps(items)) {
      final id = json['id']?.toString();
      if (id == null) continue;
      final updatedAt =
          _date(json['updatedAt']) ?? _date(json['createdAt']) ?? now;
      await _database
          .into(_database.localNotifications)
          .insertOnConflictUpdate(
            LocalNotificationsCompanion.insert(
              localId: id,
              serverId: Value(id),
              ownerId: session.userId,
              userId: session.userId,
              title: json['title']?.toString() ?? '',
              body: json['body']?.toString() ?? '',
              type: Value(json['type']?.toString() ?? 'info'),
              isRead: Value(json['isRead'] == true),
              createdAt: _date(json['createdAt']) ?? now,
              updatedAt: updatedAt,
              clientUpdatedAt: updatedAt,
              syncStatus: const Value('synced'),
              rawJson: Value(jsonEncode(json)),
            ),
          );
    }
  }

  Iterable<Map<String, dynamic>> _maps(dynamic items) {
    if (items is! List) return const [];
    return items.whereType<Map>().map(
      (item) => Map<String, dynamic>.from(item),
    );
  }

  DateTime? _date(dynamic value) {
    if (value == null) return null;
    return DateTime.tryParse(value.toString());
  }

  double _double(dynamic value) =>
      double.tryParse(value?.toString() ?? '') ?? 0;

  int _int(dynamic value) => int.tryParse(value?.toString() ?? '') ?? 0;
}
