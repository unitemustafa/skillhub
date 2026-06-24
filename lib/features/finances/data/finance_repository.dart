import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:skillhub/core/local/app_database.dart';
import 'package:skillhub/core/sync/session_service.dart';
import 'package:uuid/uuid.dart';

class FinanceRepository {
  FinanceRepository({AppDatabase? database, Uuid? uuid})
    : _database = database ?? AppDatabase.instance,
      _uuid = uuid ?? const Uuid();

  final AppDatabase _database;
  final Uuid _uuid;

  Future<List<Map<String, dynamic>>> listTransactions(
    LocalSession session,
  ) async {
    final rows =
        await (_database.select(_database.localFinanceTransactions)
              ..where((table) => table.userId.equals(session.userId))
              ..where((table) => table.deletedAt.isNull())
              ..orderBy([
                (table) => OrderingTerm(
                  expression: table.occurredAt,
                  mode: OrderingMode.desc,
                ),
              ]))
            .get();
    return rows.map(_toJson).toList(growable: false);
  }

  Future<void> createTransaction(
    LocalSession session,
    Map<String, dynamic> body,
  ) async {
    final now = DateTime.now();
    final localId = 'local-finance-${_uuid.v4()}';
    final payload = Map<String, dynamic>.from(body);
    payload['occurredAt'] ??= now.toIso8601String();

    await _database.transaction(() async {
      await _database
          .into(_database.localFinanceTransactions)
          .insert(
            LocalFinanceTransactionsCompanion.insert(
              localId: localId,
              tenantId: Value(session.tenantId),
              academyId: Value(session.academyId),
              ownerId: session.userId,
              userId: session.userId,
              createdBy: Value(session.userId),
              updatedBy: Value(session.userId),
              type: payload['type']?.toString() ?? 'expense',
              category: payload['category']?.toString() ?? 'manual',
              amount: _double(payload['amount']),
              description: payload['description']?.toString() ?? '',
              occurredAt: DateTime.parse(payload['occurredAt'].toString()),
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

  Map<String, dynamic> _toJson(LocalFinanceTransaction row) {
    return {
      'id': row.serverId ?? row.localId,
      'type': row.type,
      'category': row.category,
      'amount': row.amount,
      'description': row.description,
      'occurredAt': row.occurredAt.toIso8601String(),
      'createdAt': row.createdAt.toIso8601String(),
      'updatedAt': row.updatedAt.toIso8601String(),
      'syncStatus': row.syncStatus,
      'lastSyncError': row.lastSyncError,
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
            entityType: 'finance_transactions',
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
}
