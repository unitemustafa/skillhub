import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skillhub/core/local/app_database.dart';
import 'package:skillhub/core/network/api_client.dart';
import 'package:skillhub/core/sync/connectivity_service.dart';
import 'package:skillhub/core/sync/session_service.dart';
import 'package:skillhub/core/sync/sync_service.dart';
import 'package:skillhub/features/communications/data/messages_repository.dart';
import 'package:skillhub/features/evaluations/data/evaluations_repository.dart';
import 'package:skillhub/features/finances/data/finance_repository.dart';
import 'package:skillhub/features/notifications/data/notifications_repository.dart';
import 'package:skillhub/features/players/data/players_repository.dart';
import 'package:skillhub/features/subscriptions/data/subscriptions_repository.dart';

class _FakeConnectivityService extends ConnectivityService {
  @override
  Future<bool> hasNetworkConnection() async => true;
}

class _FakeApiClient extends ApiClient {
  _FakeApiClient() : super(baseUrl: 'https://skillhub.test');

  final posts = <Map<String, dynamic>>[];

  @override
  Future<dynamic> get(String path, {Map<String, String>? query}) async {
    if (path == '/health') return {'status': 'ok'};
    if (path == '/auth/me') {
      return {'id': 'user-1', 'email': 'u@test.local', 'role': 'user'};
    }
    if (path == '/sync/snapshot') {
      return {
        'players': [],
        'subscriptions': [],
        'evaluations': [],
        'financeTransactions': [],
        'messages': [],
        'notifications': [],
        'serverTime': DateTime.now().toIso8601String(),
        'snapshotGeneratedAt': DateTime.now().toIso8601String(),
      };
    }
    throw StateError('Unexpected GET $path');
  }

  @override
  Future<dynamic> post(
    String path,
    Map<String, dynamic> body, {
    bool authenticated = true,
    String? idempotencyKey,
  }) async {
    posts.add({'path': path, 'body': body, 'key': idempotencyKey});
    if (path == '/players') return {'id': 'Y-9999'};
    if (path == '/subscriptions') return {'id': 'sub-9999'};
    return {'id': 'created'};
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    FlutterSecureStorage.setMockInitialValues({});
  });

  AppDatabase memoryDatabase() => AppDatabase(NativeDatabase.memory());

  final session = LocalSession(
    userId: 'user-1',
    email: 'u@test.local',
    role: 'user',
    lastOnlineAt: DateTime(2026, 1, 1),
    localSessionExpiresAt: DateTime(2027, 1, 1),
  );

  test('players repository writes locally and enqueues outbox', () async {
    final db = memoryDatabase();
    addTearDown(db.close);
    final repository = PlayersRepository(database: db);

    await repository.createPlayer(session, {
      'name': 'Local Player',
      'birthDate': DateTime(2014, 1, 1).toIso8601String(),
      'phone': '01012345678',
      'guardianName': 'Guardian',
      'guardianRelation': 'parent',
      'guardianJob': null,
      'isActive': false,
    });

    final players = await repository.listPlayers(session);
    final outbox = await db.select(db.syncOutbox).get();
    expect(players, hasLength(1));
    expect(players.single.name, 'Local Player');
    expect(outbox, hasLength(1));
    expect(outbox.single.entityType, 'players');
    expect(outbox.single.status, 'pending');
  });

  test('subscriptions repository writes locally and enqueues outbox', () async {
    final db = memoryDatabase();
    addTearDown(db.close);
    final playersRepository = PlayersRepository(database: db);
    final subscriptionsRepository = SubscriptionsRepository(database: db);
    final now = DateTime(2026, 1, 10);

    final player = await playersRepository.createPlayer(session, {
      'name': 'Subscriber',
      'birthDate': DateTime(2013, 1, 1).toIso8601String(),
      'phone': '01012345678',
      'guardianName': 'Guardian',
      'guardianRelation': 'parent',
      'guardianJob': null,
      'isActive': false,
    });
    await subscriptionsRepository.createSubscription(session, player, {
      'playerId': player.id,
      'amount': '250',
      'startDate': now.toIso8601String(),
      'endDate': now.add(const Duration(days: 30)).toIso8601String(),
      'notes': 'Local subscription',
    });

    final subscriptions = await subscriptionsRepository.listSubscriptions(
      session,
    );
    final outbox = await db.select(db.syncOutbox).get();
    expect(subscriptions, hasLength(1));
    expect(subscriptions.single['player']['name'], 'Subscriber');
    expect(
      outbox.map((operation) => operation.entityType),
      containsAll(['players', 'subscriptions']),
    );
  });

  test('evaluations repository writes locally and enqueues outbox', () async {
    final db = memoryDatabase();
    addTearDown(db.close);
    final playersRepository = PlayersRepository(database: db);
    final evaluationsRepository = EvaluationsRepository(database: db);
    final now = DateTime(2026, 1, 11);

    final player = await playersRepository.createPlayer(session, {
      'name': 'Evaluated Player',
      'birthDate': DateTime(2012, 1, 1).toIso8601String(),
      'phone': '01012345678',
      'guardianName': 'Guardian',
      'guardianRelation': 'parent',
      'guardianJob': null,
      'isActive': false,
    });
    await evaluationsRepository.createEvaluation(session, player, {
      'playerId': player.id,
      'coach': 'Coach',
      'evaluationDate': now.toIso8601String(),
      'fitness': 8,
      'speed': 7,
      'skill': 9,
      'discipline': 8,
      'teamwork': 7,
      'notes': 'Strong progress',
    });

    final evaluations = await evaluationsRepository.listEvaluations(
      session,
      playerId: player.id,
    );
    final outbox = await db.select(db.syncOutbox).get();
    expect(evaluations, hasLength(1));
    expect(evaluations.single.player?.name, 'Evaluated Player');
    expect(evaluations.single.average, 7.8);
    expect(
      outbox.map((operation) => operation.entityType),
      containsAll(['players', 'evaluations']),
    );
  });

  test('finance repository writes locally and enqueues outbox', () async {
    final db = memoryDatabase();
    addTearDown(db.close);
    final repository = FinanceRepository(database: db);

    await repository.createTransaction(session, {
      'type': 'income',
      'category': 'manual',
      'amount': '300',
      'description': 'Manual income',
      'occurredAt': DateTime(2026, 1, 12).toIso8601String(),
    });

    final transactions = await repository.listTransactions(session);
    final outbox = await db.select(db.syncOutbox).get();
    expect(transactions, hasLength(1));
    expect(transactions.single['amount'], 300);
    expect(outbox.single.entityType, 'finance_transactions');
  });

  test('messages repository writes locally and enqueues outbox', () async {
    final db = memoryDatabase();
    addTearDown(db.close);
    final playersRepository = PlayersRepository(database: db);
    final messagesRepository = MessagesRepository(database: db);

    final player = await playersRepository.createPlayer(session, {
      'name': 'Message Player',
      'birthDate': DateTime(2012, 1, 1).toIso8601String(),
      'phone': '01012345678',
      'guardianName': 'Guardian',
      'guardianRelation': 'parent',
      'guardianJob': null,
      'isActive': false,
    });
    await messagesRepository.createMessage(session, player, {
      'playerId': player.id,
      'recipient': player.phone,
      'channel': 'whatsapp',
      'body': 'Hello',
      'scheduledAt': null,
    });

    final messages = await messagesRepository.listMessages(session);
    final outbox = await db.select(db.syncOutbox).get();
    expect(messages, hasLength(1));
    expect(messages.single['player']['name'], 'Message Player');
    expect(
      outbox.map((operation) => operation.entityType),
      containsAll(['players', 'messages']),
    );
  });

  test('notifications repository marks read through outbox', () async {
    final db = memoryDatabase();
    addTearDown(db.close);
    final repository = NotificationsRepository(database: db);
    final now = DateTime(2026, 1, 13);

    await db
        .into(db.localNotifications)
        .insert(
          LocalNotificationsCompanion.insert(
            localId: 'notification-1',
            serverId: const Value('notification-1'),
            ownerId: session.userId,
            userId: session.userId,
            title: 'Notice',
            body: 'Body',
            createdAt: now,
            updatedAt: now,
            clientUpdatedAt: now,
          ),
        );
    await repository.markAsRead(session, 'notification-1');

    final notifications = await repository.listNotifications(session);
    final outbox = await db.select(db.syncOutbox).get();
    expect(notifications.single['isRead'], isTrue);
    expect(outbox.single.entityType, 'notifications');
    expect(outbox.single.action, 'mark_read');
  });

  test('local reads are isolated by user id', () async {
    final db = memoryDatabase();
    addTearDown(db.close);
    final repository = PlayersRepository(database: db);
    final otherSession = LocalSession(
      userId: 'user-2',
      email: 'other@test.local',
      role: 'user',
      lastOnlineAt: DateTime(2026, 1, 1),
      localSessionExpiresAt: DateTime(2027, 1, 1),
    );

    await repository.createPlayer(session, {
      'name': 'Private Player',
      'birthDate': DateTime(2014, 1, 1).toIso8601String(),
      'phone': '01012345678',
      'guardianName': 'Guardian',
      'guardianRelation': 'parent',
      'guardianJob': null,
      'isActive': false,
    });

    expect(await repository.listPlayers(otherSession), isEmpty);
  });

  test('logout clears secure session and local account data', () async {
    final db = memoryDatabase();
    addTearDown(db.close);
    final sessionService = SessionService(database: db);
    final repository = PlayersRepository(database: db);

    await sessionService.saveOnlineSession(
      accessToken: 'token',
      userId: session.userId,
      email: session.email,
      role: session.role,
      localSessionExpiresAt: session.localSessionExpiresAt,
    );
    await repository.createPlayer(session, {
      'name': 'Cleared Player',
      'birthDate': DateTime(2014, 1, 1).toIso8601String(),
      'phone': '01012345678',
      'guardianName': 'Guardian',
      'guardianRelation': 'parent',
      'guardianJob': null,
      'isActive': false,
    });

    await sessionService.clearCurrentAccount();

    expect(await sessionService.hasValidOfflineSession(), isFalse);
    expect(await db.select(db.localPlayers).get(), isEmpty);
    expect(await db.select(db.syncOutbox).get(), isEmpty);
  });

  test(
    'sync sends player before dependent subscription and stores mapping',
    () async {
      final db = memoryDatabase();
      addTearDown(db.close);
      final sessionService = SessionService(database: db);
      final repository = PlayersRepository(database: db);
      final apiClient = _FakeApiClient();

      await sessionService.saveOnlineSession(
        accessToken: 'token',
        userId: session.userId,
        email: session.email,
        role: session.role,
        localSessionExpiresAt: session.localSessionExpiresAt,
      );
      final player = await repository.createPlayer(session, {
        'name': 'Sync Player',
        'birthDate': DateTime(2014, 1, 1).toIso8601String(),
        'phone': '01012345678',
        'guardianName': 'Guardian',
        'guardianRelation': 'parent',
        'guardianJob': null,
        'isActive': false,
      });
      final now = DateTime.now();
      await db
          .into(db.localSubscriptions)
          .insert(
            LocalSubscriptionsCompanion.insert(
              localId: 'local-sub-1',
              ownerId: session.userId,
              userId: session.userId,
              playerLocalId: Value(player.id),
              amount: 100,
              startDate: now,
              endDate: now.add(const Duration(days: 30)),
              createdAt: now,
              updatedAt: now,
              clientUpdatedAt: now,
              syncStatus: const Value('pending'),
            ),
          );
      await db
          .into(db.syncOutbox)
          .insert(
            SyncOutboxCompanion.insert(
              id: 'outbox-sub',
              operationId: 'op-sub',
              ownerId: session.userId,
              userId: session.userId,
              entityType: 'subscriptions',
              entityLocalId: 'local-sub-1',
              action: 'create',
              payloadJson:
                  '{"playerId":"${player.id}","amount":100,"startDate":"${now.toIso8601String()}","endDate":"${now.add(const Duration(days: 30)).toIso8601String()}","notes":null}',
              idempotencyKey: 'op-sub',
              createdAt: now,
              updatedAt: now,
            ),
          );

      await SyncService(
        database: db,
        apiClient: apiClient,
        connectivityService: _FakeConnectivityService(),
        sessionService: sessionService,
      ).syncNow();

      expect(apiClient.posts.map((item) => item['path']), [
        '/players',
        '/subscriptions',
      ]);
      expect(apiClient.posts[1]['body']['playerId'], 'Y-9999');
      final mappings = await db.select(db.entityMappings).get();
      final playerMapping = mappings.singleWhere(
        (mapping) => mapping.entityType == 'players',
      );
      expect(playerMapping.localId, player.id);
      expect(playerMapping.serverId, 'Y-9999');
    },
  );
}
