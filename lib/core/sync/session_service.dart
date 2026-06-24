import 'package:drift/drift.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:skillhub/core/local/app_database.dart';

class LocalSession {
  const LocalSession({
    required this.userId,
    required this.email,
    required this.role,
    required this.lastOnlineAt,
    required this.localSessionExpiresAt,
    this.tenantId,
    this.academyId,
  });

  final String userId;
  final String email;
  final String role;
  final DateTime lastOnlineAt;
  final DateTime localSessionExpiresAt;
  final String? tenantId;
  final String? academyId;

  bool get isExpired => !DateTime.now().isBefore(localSessionExpiresAt);
}

class SessionService {
  SessionService({AppDatabase? database, FlutterSecureStorage? secureStorage})
    : _database = database ?? AppDatabase.instance,
      _secureStorage = secureStorage ?? const FlutterSecureStorage();

  static const _accessTokenKey = 'skillhub_secure_access_token';
  static const _refreshTokenKey = 'skillhub_secure_refresh_token';
  static const _lastUserIdKey = 'skillhub_secure_last_user_id';

  final AppDatabase _database;
  final FlutterSecureStorage _secureStorage;

  Future<String?> get accessToken => _secureStorage.read(key: _accessTokenKey);

  Future<void> saveTokens({
    required String accessToken,
    String? refreshToken,
  }) async {
    await _secureStorage.write(key: _accessTokenKey, value: accessToken);
    if (refreshToken != null) {
      await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);
    }
  }

  Future<void> saveOnlineSession({
    required String accessToken,
    String? refreshToken,
    required String userId,
    required String email,
    required String role,
    required DateTime localSessionExpiresAt,
    String? tenantId,
    String? academyId,
  }) async {
    final now = DateTime.now();
    await saveTokens(accessToken: accessToken, refreshToken: refreshToken);
    await _secureStorage.write(key: _lastUserIdKey, value: userId);
    await _database
        .into(_database.sessionState)
        .insertOnConflictUpdate(
          SessionStateCompanion.insert(
            userId: userId,
            tenantId: Value(tenantId),
            academyId: Value(academyId),
            email: email,
            role: role,
            lastOnlineAt: now,
            localSessionExpiresAt: localSessionExpiresAt,
            createdAt: now,
            updatedAt: now,
          ),
        );
  }

  Future<LocalSession?> readLastSession() async {
    final userId = await _secureStorage.read(key: _lastUserIdKey);
    if (userId == null) {
      return null;
    }
    final row = await (_database.select(
      _database.sessionState,
    )..where((table) => table.userId.equals(userId))).getSingleOrNull();
    if (row == null) {
      return null;
    }
    return LocalSession(
      userId: row.userId,
      email: row.email,
      role: row.role,
      lastOnlineAt: row.lastOnlineAt,
      localSessionExpiresAt: row.localSessionExpiresAt,
      tenantId: row.tenantId,
      academyId: row.academyId,
    );
  }

  Future<bool> hasValidOfflineSession() async {
    final session = await readLastSession();
    return session != null && !session.isExpired;
  }

  Future<void> clearCurrentAccount() async {
    final session = await readLastSession();
    await _secureStorage.delete(key: _accessTokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
    await _secureStorage.delete(key: _lastUserIdKey);
    if (session == null) {
      return;
    }
    await _database.transaction(() async {
      await (_database.delete(
        _database.localPlayers,
      )..where((table) => table.userId.equals(session.userId))).go();
      await (_database.delete(
        _database.localSubscriptions,
      )..where((table) => table.userId.equals(session.userId))).go();
      await (_database.delete(
        _database.localEvaluations,
      )..where((table) => table.userId.equals(session.userId))).go();
      await (_database.delete(
        _database.localFinanceTransactions,
      )..where((table) => table.userId.equals(session.userId))).go();
      await (_database.delete(
        _database.localMessages,
      )..where((table) => table.userId.equals(session.userId))).go();
      await (_database.delete(
        _database.localNotifications,
      )..where((table) => table.userId.equals(session.userId))).go();
      await (_database.delete(
        _database.syncOutbox,
      )..where((table) => table.userId.equals(session.userId))).go();
      await (_database.delete(
        _database.syncMeta,
      )..where((table) => table.userId.equals(session.userId))).go();
      await (_database.delete(
        _database.entityMappings,
      )..where((table) => table.userId.equals(session.userId))).go();
      await (_database.delete(
        _database.sessionState,
      )..where((table) => table.userId.equals(session.userId))).go();
    });
  }
}
