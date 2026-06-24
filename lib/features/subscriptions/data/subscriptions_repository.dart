import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:skillhub/core/local/app_database.dart';
import 'package:skillhub/core/sync/session_service.dart';
import 'package:skillhub/features/players/domain/models/player_summary.dart';
import 'package:uuid/uuid.dart';

class SubscriptionsRepository {
  SubscriptionsRepository({AppDatabase? database, Uuid? uuid})
    : _database = database ?? AppDatabase.instance,
      _uuid = uuid ?? const Uuid();

  final AppDatabase _database;
  final Uuid _uuid;

  Future<List<Map<String, dynamic>>> listSubscriptions(
    LocalSession session, {
    String? playerId,
  }) async {
    final rows =
        await (_database.select(_database.localSubscriptions)
              ..where((table) => table.userId.equals(session.userId))
              ..where((table) => table.deletedAt.isNull())
              ..orderBy([
                (table) => OrderingTerm(
                  expression: table.endDate,
                  mode: OrderingMode.desc,
                ),
              ]))
            .get();
    final filtered = playerId == null
        ? rows
        : rows
              .where(
                (row) =>
                    row.playerLocalId == playerId ||
                    row.playerServerId == playerId,
              )
              .toList(growable: false);
    return Future.wait(filtered.map((row) => _toJson(session, row)));
  }

  Future<void> createSubscription(
    LocalSession session,
    PlayerSummary player,
    Map<String, dynamic> body,
  ) async {
    final now = DateTime.now();
    final localId = 'local-subscription-${_uuid.v4()}';
    final payload = Map<String, dynamic>.from(body);
    final playerRow = await _findPlayer(session, player.id);
    final playerLocalId = playerRow?.localId ?? player.id;
    final playerServerId = playerRow?.serverId;

    payload['playerId'] = playerServerId ?? playerLocalId;

    await _database.transaction(() async {
      await _database
          .into(_database.localSubscriptions)
          .insert(
            LocalSubscriptionsCompanion.insert(
              localId: localId,
              tenantId: Value(session.tenantId),
              academyId: Value(session.academyId),
              ownerId: session.userId,
              userId: session.userId,
              createdBy: Value(session.userId),
              updatedBy: Value(session.userId),
              playerLocalId: Value(playerLocalId),
              playerServerId: Value(playerServerId),
              amount: _double(payload['amount']),
              startDate: DateTime.parse(payload['startDate'].toString()),
              endDate: DateTime.parse(payload['endDate'].toString()),
              notes: Value(payload['notes']?.toString()),
              createdAt: now,
              updatedAt: now,
              clientUpdatedAt: now,
              syncStatus: const Value('pending'),
              rawJson: Value(jsonEncode(payload)),
            ),
          );
      await _enqueue(
        session: session,
        entityLocalId: localId,
        payload: payload,
      );
    });
  }

  Future<DateTime> renewSubscription(
    LocalSession session,
    PlayerSummary player,
  ) async {
    final latestSubscription = await _findLatestSubscription(
      session,
      player.id,
    );
    if (latestSubscription == null) {
      throw Exception('لا يوجد اشتراك سابق لهذا اللاعب للتجديد.');
    }

    final today = _dateOnly(DateTime.now());
    final latestEndDate = _dateOnly(latestSubscription.endDate);
    final startDate = latestEndDate.isAfter(today) ? latestEndDate : today;
    final endDate = _addOneMonth(startDate);

    await createSubscription(session, player, {
      'playerId': player.id,
      'amount': latestSubscription.amount,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'notes': 'تجديد اشتراك',
    });

    return endDate;
  }

  Future<LocalPlayer?> _findPlayer(LocalSession session, String id) {
    return (_database.select(_database.localPlayers)
          ..where((table) => table.userId.equals(session.userId))
          ..where(
            (table) => table.localId.equals(id) | table.serverId.equals(id),
          ))
        .getSingleOrNull();
  }

  Future<LocalSubscription?> _findLatestSubscription(
    LocalSession session,
    String playerId,
  ) {
    return (_database.select(_database.localSubscriptions)
          ..where((table) => table.userId.equals(session.userId))
          ..where((table) => table.deletedAt.isNull())
          ..where(
            (table) =>
                table.playerLocalId.equals(playerId) |
                table.playerServerId.equals(playerId),
          )
          ..orderBy([
            (table) => OrderingTerm(
              expression: table.endDate,
              mode: OrderingMode.desc,
            ),
          ])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<Map<String, dynamic>> _toJson(
    LocalSession session,
    LocalSubscription row,
  ) async {
    final playerId = row.playerServerId ?? row.playerLocalId;
    final player = playerId == null
        ? null
        : await _findPlayer(session, playerId);
    return {
      'id': row.serverId ?? row.localId,
      'playerId': playerId,
      'amount': row.amount,
      'startDate': row.startDate.toIso8601String(),
      'endDate': row.endDate.toIso8601String(),
      'notes': row.notes,
      'createdAt': row.createdAt.toIso8601String(),
      'updatedAt': row.updatedAt.toIso8601String(),
      'syncStatus': row.syncStatus,
      'lastSyncError': row.lastSyncError,
      'player': player == null ? null : _playerJson(player),
    };
  }

  Map<String, dynamic> _playerJson(LocalPlayer row) {
    return {
      'id': row.serverId ?? row.localId,
      'name': row.name,
      'birthDate': row.birthDate.toIso8601String(),
      'phone': row.phone,
      'guardianName': row.guardianName,
      'guardianRelation': row.guardianRelation,
      'guardianJob': row.guardianJob,
      'isActive': row.isActive,
    };
  }

  Future<void> _enqueue({
    required LocalSession session,
    required String entityLocalId,
    required Map<String, dynamic> payload,
  }) async {
    final now = DateTime.now();
    final operationId = _uuid.v4();
    await _database
        .into(_database.syncOutbox)
        .insert(
          SyncOutboxCompanion.insert(
            id: 'outbox-$operationId',
            operationId: operationId,
            tenantId: Value(session.tenantId),
            academyId: Value(session.academyId),
            ownerId: session.userId,
            userId: session.userId,
            entityType: 'subscriptions',
            entityLocalId: entityLocalId,
            action: 'create',
            payloadJson: jsonEncode(payload),
            idempotencyKey: operationId,
            createdAt: now,
            updatedAt: now,
          ),
        );
  }

  double _double(dynamic value) {
    if (value is num) return value.toDouble();
    return double.tryParse(value?.toString() ?? '') ?? 0;
  }

  DateTime _dateOnly(DateTime value) {
    return DateTime(value.year, value.month, value.day);
  }

  DateTime _addOneMonth(DateTime value) {
    final nextMonth = value.month == 12 ? 1 : value.month + 1;
    final nextYear = value.month == 12 ? value.year + 1 : value.year;
    final lastDayOfNextMonth = DateTime(nextYear, nextMonth + 1, 0).day;
    final day = value.day > lastDayOfNextMonth ? lastDayOfNextMonth : value.day;
    return DateTime(nextYear, nextMonth, day);
  }
}
