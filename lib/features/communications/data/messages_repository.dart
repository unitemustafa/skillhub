import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:skillhub/core/local/app_database.dart';
import 'package:skillhub/core/sync/session_service.dart';
import 'package:skillhub/features/players/domain/models/player_summary.dart';
import 'package:uuid/uuid.dart';

class MessagesRepository {
  MessagesRepository({AppDatabase? database, Uuid? uuid})
    : _database = database ?? AppDatabase.instance,
      _uuid = uuid ?? const Uuid();

  final AppDatabase _database;
  final Uuid _uuid;

  Future<List<Map<String, dynamic>>> listMessages(LocalSession session) async {
    final rows =
        await (_database.select(_database.localMessages)
              ..where((table) => table.userId.equals(session.userId))
              ..where((table) => table.deletedAt.isNull())
              ..orderBy([
                (table) => OrderingTerm(
                  expression: table.createdAt,
                  mode: OrderingMode.desc,
                ),
              ]))
            .get();
    return Future.wait(rows.map((row) => _toJson(session, row)));
  }

  Future<void> createMessage(
    LocalSession session,
    PlayerSummary? player,
    Map<String, dynamic> body,
  ) async {
    final now = DateTime.now();
    final localId = 'local-message-${_uuid.v4()}';
    final payload = Map<String, dynamic>.from(body);
    final playerRow = player == null
        ? null
        : await _findPlayer(session, player.id);
    final playerLocalId = playerRow?.localId ?? player?.id;
    final playerServerId = playerRow?.serverId;
    final scheduledAt = _date(payload['scheduledAt']);
    final status = scheduledAt != null && scheduledAt.isAfter(now)
        ? 'scheduled'
        : 'pending';

    payload['playerId'] = playerServerId ?? playerLocalId;

    await _database.transaction(() async {
      await _database
          .into(_database.localMessages)
          .insert(
            LocalMessagesCompanion.insert(
              localId: localId,
              tenantId: Value(session.tenantId),
              academyId: Value(session.academyId),
              ownerId: session.userId,
              userId: session.userId,
              createdBy: Value(session.userId),
              updatedBy: Value(session.userId),
              playerLocalId: Value(playerLocalId),
              playerServerId: Value(playerServerId),
              recipient: payload['recipient']?.toString() ?? '',
              channel: payload['channel']?.toString() ?? 'whatsapp',
              body: payload['body']?.toString() ?? '',
              status: Value(status),
              scheduledAt: Value(scheduledAt),
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

  Future<LocalPlayer?> _findPlayer(LocalSession session, String id) {
    return (_database.select(_database.localPlayers)
          ..where((table) => table.userId.equals(session.userId))
          ..where(
            (table) => table.localId.equals(id) | table.serverId.equals(id),
          ))
        .getSingleOrNull();
  }

  Future<Map<String, dynamic>> _toJson(
    LocalSession session,
    LocalMessage row,
  ) async {
    final playerId = row.playerServerId ?? row.playerLocalId;
    final player = playerId == null
        ? null
        : await _findPlayer(session, playerId);
    return {
      'id': row.serverId ?? row.localId,
      'playerId': playerId,
      'recipient': row.recipient,
      'channel': row.channel,
      'body': row.body,
      'status': row.status,
      'scheduledAt': row.scheduledAt?.toIso8601String(),
      'sentAt': row.sentAt?.toIso8601String(),
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
            entityType: 'messages',
            entityLocalId: entityLocalId,
            action: 'create',
            payloadJson: jsonEncode(payload),
            idempotencyKey: operationId,
            createdAt: now,
            updatedAt: now,
          ),
        );
  }

  DateTime? _date(dynamic value) {
    if (value == null) return null;
    return DateTime.tryParse(value.toString());
  }
}
