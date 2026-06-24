import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:skillhub/core/local/app_database.dart';
import 'package:skillhub/core/sync/session_service.dart';
import 'package:skillhub/features/evaluations/domain/models/evaluation_record.dart';
import 'package:skillhub/features/players/domain/models/player_summary.dart';
import 'package:uuid/uuid.dart';

class EvaluationsRepository {
  EvaluationsRepository({AppDatabase? database, Uuid? uuid})
    : _database = database ?? AppDatabase.instance,
      _uuid = uuid ?? const Uuid();

  final AppDatabase _database;
  final Uuid _uuid;

  Future<List<EvaluationRecord>> listEvaluations(
    LocalSession session, {
    String? playerId,
  }) async {
    final rows =
        await (_database.select(_database.localEvaluations)
              ..where((table) => table.userId.equals(session.userId))
              ..where((table) => table.deletedAt.isNull())
              ..orderBy([
                (table) => OrderingTerm(
                  expression: table.evaluationDate,
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
    final jsonRows = await Future.wait(
      filtered.map((row) => _toJson(session, row)),
    );
    return jsonRows.map(EvaluationRecord.fromJson).toList(growable: false);
  }

  Future<void> createEvaluation(
    LocalSession session,
    PlayerSummary player,
    Map<String, dynamic> body,
  ) async {
    final now = DateTime.now();
    final localId = 'local-evaluation-${_uuid.v4()}';
    final payload = Map<String, dynamic>.from(body);
    final playerRow = await _findPlayer(session, player.id);
    final playerLocalId = playerRow?.localId ?? player.id;
    final playerServerId = playerRow?.serverId;

    payload['playerId'] = playerServerId ?? playerLocalId;

    await _database.transaction(() async {
      await _database
          .into(_database.localEvaluations)
          .insert(
            LocalEvaluationsCompanion.insert(
              localId: localId,
              tenantId: Value(session.tenantId),
              academyId: Value(session.academyId),
              ownerId: session.userId,
              userId: session.userId,
              createdBy: Value(session.userId),
              updatedBy: Value(session.userId),
              playerLocalId: Value(playerLocalId),
              playerServerId: Value(playerServerId),
              coach: payload['coach']?.toString() ?? '',
              evaluationDate: DateTime.parse(
                payload['evaluationDate'].toString(),
              ),
              fitness: _int(payload['fitness']),
              speed: _int(payload['speed']),
              skill: _int(payload['skill']),
              discipline: _int(payload['discipline']),
              teamwork: _int(payload['teamwork']),
              notes: Value(payload['notes']?.toString() ?? ''),
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
    LocalEvaluation row,
  ) async {
    final playerId = row.playerServerId ?? row.playerLocalId;
    final player = playerId == null
        ? null
        : await _findPlayer(session, playerId);
    return {
      'id': row.serverId ?? row.localId,
      'playerId': playerId,
      'coach': row.coach,
      'evaluationDate': row.evaluationDate.toIso8601String(),
      'fitness': row.fitness,
      'speed': row.speed,
      'skill': row.skill,
      'discipline': row.discipline,
      'teamwork': row.teamwork,
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
            entityType: 'evaluations',
            entityLocalId: entityLocalId,
            action: 'create',
            payloadJson: jsonEncode(payload),
            idempotencyKey: operationId,
            createdAt: now,
            updatedAt: now,
          ),
        );
  }

  int _int(dynamic value) {
    if (value is num) return value.round();
    return int.tryParse(value?.toString() ?? '') ?? 0;
  }
}
