import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

class LocalPlayers extends Table {
  TextColumn get localId => text()();
  TextColumn get serverId => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get academyId => text().nullable()();
  TextColumn get ownerId => text()();
  TextColumn get userId => text()();
  TextColumn get createdBy => text().nullable()();
  TextColumn get updatedBy => text().nullable()();
  TextColumn get name => text()();
  DateTimeColumn get birthDate => dateTime()();
  TextColumn get phone => text()();
  TextColumn get guardianName => text()();
  TextColumn get guardianRelation => text()();
  TextColumn get guardianJob => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get clientUpdatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  TextColumn get lastSyncError => text().nullable()();
  IntColumn get version => integer().nullable()();
  TextColumn get rawJson => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {localId};
}

class LocalSubscriptions extends Table {
  TextColumn get localId => text()();
  TextColumn get serverId => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get academyId => text().nullable()();
  TextColumn get ownerId => text()();
  TextColumn get userId => text()();
  TextColumn get createdBy => text().nullable()();
  TextColumn get updatedBy => text().nullable()();
  TextColumn get playerLocalId => text().nullable()();
  TextColumn get playerServerId => text().nullable()();
  RealColumn get amount => real()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get clientUpdatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  TextColumn get lastSyncError => text().nullable()();
  IntColumn get version => integer().nullable()();
  TextColumn get rawJson => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {localId};
}

class LocalEvaluations extends Table {
  TextColumn get localId => text()();
  TextColumn get serverId => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get academyId => text().nullable()();
  TextColumn get ownerId => text()();
  TextColumn get userId => text()();
  TextColumn get createdBy => text().nullable()();
  TextColumn get updatedBy => text().nullable()();
  TextColumn get playerLocalId => text().nullable()();
  TextColumn get playerServerId => text().nullable()();
  TextColumn get coach => text()();
  DateTimeColumn get evaluationDate => dateTime()();
  IntColumn get fitness => integer()();
  IntColumn get speed => integer()();
  IntColumn get skill => integer()();
  IntColumn get discipline => integer()();
  IntColumn get teamwork => integer()();
  TextColumn get notes => text().withDefault(const Constant(''))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get clientUpdatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  TextColumn get lastSyncError => text().nullable()();
  IntColumn get version => integer().nullable()();
  TextColumn get rawJson => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {localId};
}

class LocalFinanceTransactions extends Table {
  TextColumn get localId => text()();
  TextColumn get serverId => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get academyId => text().nullable()();
  TextColumn get ownerId => text()();
  TextColumn get userId => text()();
  TextColumn get createdBy => text().nullable()();
  TextColumn get updatedBy => text().nullable()();
  TextColumn get type => text()();
  TextColumn get category => text()();
  RealColumn get amount => real()();
  TextColumn get description => text()();
  DateTimeColumn get occurredAt => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get clientUpdatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  TextColumn get lastSyncError => text().nullable()();
  IntColumn get version => integer().nullable()();
  TextColumn get rawJson => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {localId};
}

class LocalMessages extends Table {
  TextColumn get localId => text()();
  TextColumn get serverId => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get academyId => text().nullable()();
  TextColumn get ownerId => text()();
  TextColumn get userId => text()();
  TextColumn get createdBy => text().nullable()();
  TextColumn get updatedBy => text().nullable()();
  TextColumn get playerLocalId => text().nullable()();
  TextColumn get playerServerId => text().nullable()();
  TextColumn get recipient => text()();
  TextColumn get channel => text()();
  TextColumn get body => text()();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  DateTimeColumn get scheduledAt => dateTime().nullable()();
  DateTimeColumn get sentAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get clientUpdatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  TextColumn get lastSyncError => text().nullable()();
  IntColumn get version => integer().nullable()();
  TextColumn get rawJson => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {localId};
}

class LocalNotifications extends Table {
  TextColumn get localId => text()();
  TextColumn get serverId => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get academyId => text().nullable()();
  TextColumn get ownerId => text()();
  TextColumn get userId => text()();
  TextColumn get createdBy => text().nullable()();
  TextColumn get updatedBy => text().nullable()();
  TextColumn get title => text()();
  TextColumn get body => text()();
  TextColumn get type => text().withDefault(const Constant('info'))();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get clientUpdatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  TextColumn get lastSyncError => text().nullable()();
  IntColumn get version => integer().nullable()();
  TextColumn get rawJson => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {localId};
}

class SyncOutbox extends Table {
  TextColumn get id => text()();
  TextColumn get operationId => text()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get academyId => text().nullable()();
  TextColumn get ownerId => text()();
  TextColumn get userId => text()();
  TextColumn get entityType => text()();
  TextColumn get entityLocalId => text()();
  TextColumn get entityServerId => text().nullable()();
  TextColumn get action => text()();
  TextColumn get payloadJson => text()();
  TextColumn get idempotencyKey => text()();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  TextColumn get lastError => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class SessionState extends Table {
  TextColumn get userId => text()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get academyId => text().nullable()();
  TextColumn get email => text()();
  TextColumn get role => text()();
  DateTimeColumn get lastOnlineAt => dateTime()();
  DateTimeColumn get localSessionExpiresAt => dateTime()();
  BoolColumn get isLastOnlineSession =>
      boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {userId};
}

class SyncMeta extends Table {
  TextColumn get ownerId => text()();
  TextColumn get userId => text()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get academyId => text().nullable()();
  DateTimeColumn get lastPulledAt => dateTime().nullable()();
  DateTimeColumn get lastPushedAt => dateTime().nullable()();
  DateTimeColumn get serverTime => dateTime().nullable()();
  TextColumn get lastSyncError => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {ownerId};
}

class EntityMappings extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get academyId => text().nullable()();
  TextColumn get ownerId => text()();
  TextColumn get userId => text()();
  TextColumn get entityType => text()();
  TextColumn get localId => text()();
  TextColumn get serverId => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class AdminUsersCache extends Table {
  TextColumn get id => text()();
  TextColumn get adminUserId => text()();
  TextColumn get email => text()();
  TextColumn get payloadJson => text()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    LocalPlayers,
    LocalSubscriptions,
    LocalEvaluations,
    LocalFinanceTransactions,
    LocalMessages,
    LocalNotifications,
    SyncOutbox,
    SessionState,
    SyncMeta,
    EntityMappings,
    AdminUsersCache,
  ],
)
class AppDatabase extends _$AppDatabase {
  static final AppDatabase instance = AppDatabase();

  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'skillhub_local',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
