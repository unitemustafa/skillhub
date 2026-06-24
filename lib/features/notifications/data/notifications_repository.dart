import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:skillhub/core/local/app_database.dart';
import 'package:skillhub/core/sync/session_service.dart';
import 'package:uuid/uuid.dart';

class NotificationsRepository {
  NotificationsRepository({AppDatabase? database, Uuid? uuid})
    : _database = database ?? AppDatabase.instance,
      _uuid = uuid ?? const Uuid();

  final AppDatabase _database;
  final Uuid _uuid;

  Future<List<Map<String, dynamic>>> listNotifications(
    LocalSession session,
  ) async {
    final rows =
        await (_database.select(_database.localNotifications)
              ..where((table) => table.userId.equals(session.userId))
              ..where((table) => table.deletedAt.isNull())
              ..orderBy([
                (table) => OrderingTerm(
                  expression: table.createdAt,
                  mode: OrderingMode.desc,
                ),
              ]))
            .get();
    return rows.map(_toJson).toList(growable: false);
  }

  Future<void> markAllAsRead(LocalSession session) async {
    final rows =
        await (_database.select(_database.localNotifications)
              ..where((table) => table.userId.equals(session.userId))
              ..where((table) => table.isRead.equals(false))
              ..where((table) => table.deletedAt.isNull()))
            .get();
    for (final row in rows) {
      await markAsRead(session, row.serverId ?? row.localId);
    }
  }

  Future<void> markAsRead(LocalSession session, String id) async {
    final row = await _findNotification(session, id);
    if (row == null || row.isRead) return;
    final now = DateTime.now();
    await _database.transaction(() async {
      await (_database.update(
        _database.localNotifications,
      )..where((table) => table.localId.equals(row.localId))).write(
        LocalNotificationsCompanion(
          isRead: const Value(true),
          syncStatus: const Value('pending'),
          clientUpdatedAt: Value(now),
          updatedAt: Value(now),
        ),
      );
      await _enqueue(
        session: session,
        entityLocalId: row.localId,
        entityServerId: row.serverId,
        action: 'mark_read',
        payload: {'serverId': row.serverId ?? row.localId},
      );
    });
  }

  Future<void> deleteNotification(LocalSession session, String id) async {
    final row = await _findNotification(session, id);
    if (row == null) return;
    final now = DateTime.now();
    await _database.transaction(() async {
      await (_database.update(
        _database.localNotifications,
      )..where((table) => table.localId.equals(row.localId))).write(
        LocalNotificationsCompanion(
          deletedAt: Value(now),
          syncStatus: const Value('pending'),
          clientUpdatedAt: Value(now),
          updatedAt: Value(now),
        ),
      );
      await _enqueue(
        session: session,
        entityLocalId: row.localId,
        entityServerId: row.serverId,
        action: 'delete',
        payload: {'serverId': row.serverId ?? row.localId},
      );
    });
  }

  Future<LocalNotification?> _findNotification(
    LocalSession session,
    String id,
  ) {
    return (_database.select(_database.localNotifications)
          ..where((table) => table.userId.equals(session.userId))
          ..where(
            (table) => table.localId.equals(id) | table.serverId.equals(id),
          ))
        .getSingleOrNull();
  }

  Map<String, dynamic> _toJson(LocalNotification row) {
    return {
      'id': row.serverId ?? row.localId,
      'title': row.title,
      'body': row.body,
      'type': row.type,
      'isRead': row.isRead,
      'createdAt': row.createdAt.toIso8601String(),
      'updatedAt': row.updatedAt.toIso8601String(),
      'syncStatus': row.syncStatus,
      'lastSyncError': row.lastSyncError,
    };
  }

  Future<void> _enqueue({
    required LocalSession session,
    required String entityLocalId,
    String? entityServerId,
    required String action,
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
            entityType: 'notifications',
            entityLocalId: entityLocalId,
            entityServerId: Value(entityServerId),
            action: action,
            payloadJson: jsonEncode(payload),
            idempotencyKey: operationId,
            createdAt: now,
            updatedAt: now,
          ),
        );
  }
}
