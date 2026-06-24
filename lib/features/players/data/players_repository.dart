import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:skillhub/core/local/app_database.dart';
import 'package:skillhub/core/sync/session_service.dart';
import 'package:skillhub/features/players/domain/models/player_summary.dart';
import 'package:uuid/uuid.dart';

class PlayersRepository {
  PlayersRepository({AppDatabase? database, Uuid? uuid})
    : _database = database ?? AppDatabase.instance,
      _uuid = uuid ?? const Uuid();

  final AppDatabase _database;
  final Uuid _uuid;

  Future<List<PlayerSummary>> listPlayers(LocalSession session) async {
    final rows =
        await (_database.select(_database.localPlayers)
              ..where((table) => table.userId.equals(session.userId))
              ..where((table) => table.deletedAt.isNull())
              ..orderBy([
                (table) => OrderingTerm(
                  expression: table.createdAt,
                  mode: OrderingMode.desc,
                ),
              ]))
            .get();
    return rows.map(_toSummary).toList(growable: false);
  }

  Stream<List<PlayerSummary>> watchPlayers(LocalSession session) {
    return (_database.select(_database.localPlayers)
          ..where((table) => table.userId.equals(session.userId))
          ..where((table) => table.deletedAt.isNull())
          ..orderBy([
            (table) => OrderingTerm(
              expression: table.createdAt,
              mode: OrderingMode.desc,
            ),
          ]))
        .watch()
        .map((rows) => rows.map(_toSummary).toList(growable: false));
  }

  Future<PlayerSummary> createPlayer(
    LocalSession session,
    Map<String, dynamic> body,
  ) async {
    final now = DateTime.now();
    final localId = 'local-player-${_uuid.v4()}';
    final birthDate = DateTime.parse(body['birthDate'].toString());
    final payload = Map<String, dynamic>.from(body);

    await _database.transaction(() async {
      await _database
          .into(_database.localPlayers)
          .insert(
            LocalPlayersCompanion.insert(
              localId: localId,
              tenantId: Value(session.tenantId),
              academyId: Value(session.academyId),
              ownerId: session.userId,
              userId: session.userId,
              createdBy: Value(session.userId),
              updatedBy: Value(session.userId),
              name: payload['name']?.toString() ?? '',
              birthDate: birthDate,
              phone: payload['phone']?.toString() ?? '',
              guardianName: payload['guardianName']?.toString() ?? '',
              guardianRelation: payload['guardianRelation']?.toString() ?? '',
              guardianJob: Value(payload['guardianJob']?.toString()),
              isActive: Value(payload['isActive'] == true),
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
        action: 'create',
        payload: payload,
      );
    });

    return _toSummary(
      LocalPlayer(
        localId: localId,
        serverId: null,
        tenantId: session.tenantId,
        academyId: session.academyId,
        ownerId: session.userId,
        userId: session.userId,
        createdBy: session.userId,
        updatedBy: session.userId,
        name: payload['name']?.toString() ?? '',
        birthDate: birthDate,
        phone: payload['phone']?.toString() ?? '',
        guardianName: payload['guardianName']?.toString() ?? '',
        guardianRelation: payload['guardianRelation']?.toString() ?? '',
        guardianJob: payload['guardianJob']?.toString(),
        isActive: payload['isActive'] == true,
        createdAt: now,
        updatedAt: now,
        clientUpdatedAt: now,
        deletedAt: null,
        syncStatus: 'pending',
        lastSyncError: null,
        version: null,
        rawJson: jsonEncode(payload),
      ),
    );
  }

  Future<void> updatePlayer(
    LocalSession session,
    PlayerSummary player,
    Map<String, dynamic> body,
  ) async {
    final now = DateTime.now();
    final payload = Map<String, dynamic>.from(body);
    final localId = player.id;
    final existing =
        await (_database.select(_database.localPlayers)
              ..where((table) => table.userId.equals(session.userId))
              ..where(
                (table) =>
                    table.localId.equals(localId) |
                    table.serverId.equals(localId),
              ))
            .getSingleOrNull();
    final effectiveLocalId = existing?.localId ?? localId;

    await _database.transaction(() async {
      await _database
          .into(_database.localPlayers)
          .insertOnConflictUpdate(
            LocalPlayersCompanion.insert(
              localId: effectiveLocalId,
              serverId: Value(existing?.serverId),
              tenantId: Value(session.tenantId),
              academyId: Value(session.academyId),
              ownerId: session.userId,
              userId: session.userId,
              createdBy: Value(existing?.createdBy ?? session.userId),
              updatedBy: Value(session.userId),
              name: payload['name']?.toString() ?? '',
              birthDate: DateTime.parse(payload['birthDate'].toString()),
              phone: payload['phone']?.toString() ?? '',
              guardianName: payload['guardianName']?.toString() ?? '',
              guardianRelation: payload['guardianRelation']?.toString() ?? '',
              guardianJob: Value(payload['guardianJob']?.toString()),
              isActive: Value(payload['isActive'] == true),
              createdAt: existing?.createdAt ?? now,
              updatedAt: now,
              clientUpdatedAt: now,
              syncStatus: const Value('pending'),
              rawJson: Value(jsonEncode(payload)),
            ),
          );
      await _enqueue(
        session: session,
        entityLocalId: effectiveLocalId,
        entityServerId: existing?.serverId,
        action: existing?.serverId == null ? 'create' : 'update',
        payload: payload,
      );
    });
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
            entityType: 'players',
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

  PlayerSummary _toSummary(LocalPlayer row) {
    return PlayerSummary.fromJson({
      'id': row.serverId ?? row.localId,
      'name': row.name,
      'birthDate': row.birthDate.toIso8601String(),
      'phone': row.phone,
      'guardianName': row.guardianName,
      'guardianRelation': row.guardianRelation,
      'guardianJob': row.guardianJob,
      'isActive': row.isActive,
      'syncStatus': row.syncStatus,
      'lastSyncError': row.lastSyncError,
    });
  }
}
