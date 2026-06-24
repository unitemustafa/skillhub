// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $LocalPlayersTable extends LocalPlayers
    with TableInfo<$LocalPlayersTable, LocalPlayer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalPlayersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<String> localId = GeneratedColumn<String>(
    'local_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tenantIdMeta = const VerificationMeta(
    'tenantId',
  );
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
    'tenant_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _academyIdMeta = const VerificationMeta(
    'academyId',
  );
  @override
  late final GeneratedColumn<String> academyId = GeneratedColumn<String>(
    'academy_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdByMeta = const VerificationMeta(
    'createdBy',
  );
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
    'created_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByMeta = const VerificationMeta(
    'updatedBy',
  );
  @override
  late final GeneratedColumn<String> updatedBy = GeneratedColumn<String>(
    'updated_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _birthDateMeta = const VerificationMeta(
    'birthDate',
  );
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
    'birth_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _guardianNameMeta = const VerificationMeta(
    'guardianName',
  );
  @override
  late final GeneratedColumn<String> guardianName = GeneratedColumn<String>(
    'guardian_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _guardianRelationMeta = const VerificationMeta(
    'guardianRelation',
  );
  @override
  late final GeneratedColumn<String> guardianRelation = GeneratedColumn<String>(
    'guardian_relation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _guardianJobMeta = const VerificationMeta(
    'guardianJob',
  );
  @override
  late final GeneratedColumn<String> guardianJob = GeneratedColumn<String>(
    'guardian_job',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientUpdatedAtMeta = const VerificationMeta(
    'clientUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> clientUpdatedAt =
      GeneratedColumn<DateTime>(
        'client_updated_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('synced'),
  );
  static const VerificationMeta _lastSyncErrorMeta = const VerificationMeta(
    'lastSyncError',
  );
  @override
  late final GeneratedColumn<String> lastSyncError = GeneratedColumn<String>(
    'last_sync_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rawJsonMeta = const VerificationMeta(
    'rawJson',
  );
  @override
  late final GeneratedColumn<String> rawJson = GeneratedColumn<String>(
    'raw_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    serverId,
    tenantId,
    academyId,
    ownerId,
    userId,
    createdBy,
    updatedBy,
    name,
    birthDate,
    phone,
    guardianName,
    guardianRelation,
    guardianJob,
    isActive,
    createdAt,
    updatedAt,
    clientUpdatedAt,
    deletedAt,
    syncStatus,
    lastSyncError,
    version,
    rawJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_players';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalPlayer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    } else if (isInserting) {
      context.missing(_localIdMeta);
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    }
    if (data.containsKey('tenant_id')) {
      context.handle(
        _tenantIdMeta,
        tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta),
      );
    }
    if (data.containsKey('academy_id')) {
      context.handle(
        _academyIdMeta,
        academyId.isAcceptableOrUnknown(data['academy_id']!, _academyIdMeta),
      );
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_by')) {
      context.handle(
        _createdByMeta,
        createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta),
      );
    }
    if (data.containsKey('updated_by')) {
      context.handle(
        _updatedByMeta,
        updatedBy.isAcceptableOrUnknown(data['updated_by']!, _updatedByMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(
        _birthDateMeta,
        birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta),
      );
    } else if (isInserting) {
      context.missing(_birthDateMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('guardian_name')) {
      context.handle(
        _guardianNameMeta,
        guardianName.isAcceptableOrUnknown(
          data['guardian_name']!,
          _guardianNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_guardianNameMeta);
    }
    if (data.containsKey('guardian_relation')) {
      context.handle(
        _guardianRelationMeta,
        guardianRelation.isAcceptableOrUnknown(
          data['guardian_relation']!,
          _guardianRelationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_guardianRelationMeta);
    }
    if (data.containsKey('guardian_job')) {
      context.handle(
        _guardianJobMeta,
        guardianJob.isAcceptableOrUnknown(
          data['guardian_job']!,
          _guardianJobMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('client_updated_at')) {
      context.handle(
        _clientUpdatedAtMeta,
        clientUpdatedAt.isAcceptableOrUnknown(
          data['client_updated_at']!,
          _clientUpdatedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_clientUpdatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('last_sync_error')) {
      context.handle(
        _lastSyncErrorMeta,
        lastSyncError.isAcceptableOrUnknown(
          data['last_sync_error']!,
          _lastSyncErrorMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('raw_json')) {
      context.handle(
        _rawJsonMeta,
        rawJson.isAcceptableOrUnknown(data['raw_json']!, _rawJsonMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  LocalPlayer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalPlayer(
      localId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_id'],
      )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      ),
      tenantId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_id'],
      ),
      academyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}academy_id'],
      ),
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by'],
      ),
      updatedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      birthDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birth_date'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      guardianName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guardian_name'],
      )!,
      guardianRelation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guardian_relation'],
      )!,
      guardianJob: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guardian_job'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      clientUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}client_updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      lastSyncError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_sync_error'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      ),
      rawJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_json'],
      ),
    );
  }

  @override
  $LocalPlayersTable createAlias(String alias) {
    return $LocalPlayersTable(attachedDatabase, alias);
  }
}

class LocalPlayer extends DataClass implements Insertable<LocalPlayer> {
  final String localId;
  final String? serverId;
  final String? tenantId;
  final String? academyId;
  final String ownerId;
  final String userId;
  final String? createdBy;
  final String? updatedBy;
  final String name;
  final DateTime birthDate;
  final String phone;
  final String guardianName;
  final String guardianRelation;
  final String? guardianJob;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime clientUpdatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? lastSyncError;
  final int? version;
  final String? rawJson;
  const LocalPlayer({
    required this.localId,
    this.serverId,
    this.tenantId,
    this.academyId,
    required this.ownerId,
    required this.userId,
    this.createdBy,
    this.updatedBy,
    required this.name,
    required this.birthDate,
    required this.phone,
    required this.guardianName,
    required this.guardianRelation,
    this.guardianJob,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.clientUpdatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.lastSyncError,
    this.version,
    this.rawJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<String>(localId);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<String>(serverId);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || academyId != null) {
      map['academy_id'] = Variable<String>(academyId);
    }
    map['owner_id'] = Variable<String>(ownerId);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    map['name'] = Variable<String>(name);
    map['birth_date'] = Variable<DateTime>(birthDate);
    map['phone'] = Variable<String>(phone);
    map['guardian_name'] = Variable<String>(guardianName);
    map['guardian_relation'] = Variable<String>(guardianRelation);
    if (!nullToAbsent || guardianJob != null) {
      map['guardian_job'] = Variable<String>(guardianJob);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['client_updated_at'] = Variable<DateTime>(clientUpdatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncError != null) {
      map['last_sync_error'] = Variable<String>(lastSyncError);
    }
    if (!nullToAbsent || version != null) {
      map['version'] = Variable<int>(version);
    }
    if (!nullToAbsent || rawJson != null) {
      map['raw_json'] = Variable<String>(rawJson);
    }
    return map;
  }

  LocalPlayersCompanion toCompanion(bool nullToAbsent) {
    return LocalPlayersCompanion(
      localId: Value(localId),
      serverId: serverId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverId),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      academyId: academyId == null && nullToAbsent
          ? const Value.absent()
          : Value(academyId),
      ownerId: Value(ownerId),
      userId: Value(userId),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      name: Value(name),
      birthDate: Value(birthDate),
      phone: Value(phone),
      guardianName: Value(guardianName),
      guardianRelation: Value(guardianRelation),
      guardianJob: guardianJob == null && nullToAbsent
          ? const Value.absent()
          : Value(guardianJob),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      clientUpdatedAt: Value(clientUpdatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      lastSyncError: lastSyncError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncError),
      version: version == null && nullToAbsent
          ? const Value.absent()
          : Value(version),
      rawJson: rawJson == null && nullToAbsent
          ? const Value.absent()
          : Value(rawJson),
    );
  }

  factory LocalPlayer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalPlayer(
      localId: serializer.fromJson<String>(json['localId']),
      serverId: serializer.fromJson<String?>(json['serverId']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      academyId: serializer.fromJson<String?>(json['academyId']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      userId: serializer.fromJson<String>(json['userId']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
      updatedBy: serializer.fromJson<String?>(json['updatedBy']),
      name: serializer.fromJson<String>(json['name']),
      birthDate: serializer.fromJson<DateTime>(json['birthDate']),
      phone: serializer.fromJson<String>(json['phone']),
      guardianName: serializer.fromJson<String>(json['guardianName']),
      guardianRelation: serializer.fromJson<String>(json['guardianRelation']),
      guardianJob: serializer.fromJson<String?>(json['guardianJob']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      clientUpdatedAt: serializer.fromJson<DateTime>(json['clientUpdatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncError: serializer.fromJson<String?>(json['lastSyncError']),
      version: serializer.fromJson<int?>(json['version']),
      rawJson: serializer.fromJson<String?>(json['rawJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<String>(localId),
      'serverId': serializer.toJson<String?>(serverId),
      'tenantId': serializer.toJson<String?>(tenantId),
      'academyId': serializer.toJson<String?>(academyId),
      'ownerId': serializer.toJson<String>(ownerId),
      'userId': serializer.toJson<String>(userId),
      'createdBy': serializer.toJson<String?>(createdBy),
      'updatedBy': serializer.toJson<String?>(updatedBy),
      'name': serializer.toJson<String>(name),
      'birthDate': serializer.toJson<DateTime>(birthDate),
      'phone': serializer.toJson<String>(phone),
      'guardianName': serializer.toJson<String>(guardianName),
      'guardianRelation': serializer.toJson<String>(guardianRelation),
      'guardianJob': serializer.toJson<String?>(guardianJob),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'clientUpdatedAt': serializer.toJson<DateTime>(clientUpdatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncError': serializer.toJson<String?>(lastSyncError),
      'version': serializer.toJson<int?>(version),
      'rawJson': serializer.toJson<String?>(rawJson),
    };
  }

  LocalPlayer copyWith({
    String? localId,
    Value<String?> serverId = const Value.absent(),
    Value<String?> tenantId = const Value.absent(),
    Value<String?> academyId = const Value.absent(),
    String? ownerId,
    String? userId,
    Value<String?> createdBy = const Value.absent(),
    Value<String?> updatedBy = const Value.absent(),
    String? name,
    DateTime? birthDate,
    String? phone,
    String? guardianName,
    String? guardianRelation,
    Value<String?> guardianJob = const Value.absent(),
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? clientUpdatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> lastSyncError = const Value.absent(),
    Value<int?> version = const Value.absent(),
    Value<String?> rawJson = const Value.absent(),
  }) => LocalPlayer(
    localId: localId ?? this.localId,
    serverId: serverId.present ? serverId.value : this.serverId,
    tenantId: tenantId.present ? tenantId.value : this.tenantId,
    academyId: academyId.present ? academyId.value : this.academyId,
    ownerId: ownerId ?? this.ownerId,
    userId: userId ?? this.userId,
    createdBy: createdBy.present ? createdBy.value : this.createdBy,
    updatedBy: updatedBy.present ? updatedBy.value : this.updatedBy,
    name: name ?? this.name,
    birthDate: birthDate ?? this.birthDate,
    phone: phone ?? this.phone,
    guardianName: guardianName ?? this.guardianName,
    guardianRelation: guardianRelation ?? this.guardianRelation,
    guardianJob: guardianJob.present ? guardianJob.value : this.guardianJob,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    clientUpdatedAt: clientUpdatedAt ?? this.clientUpdatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    lastSyncError: lastSyncError.present
        ? lastSyncError.value
        : this.lastSyncError,
    version: version.present ? version.value : this.version,
    rawJson: rawJson.present ? rawJson.value : this.rawJson,
  );
  LocalPlayer copyWithCompanion(LocalPlayersCompanion data) {
    return LocalPlayer(
      localId: data.localId.present ? data.localId.value : this.localId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      tenantId: data.tenantId.present ? data.tenantId.value : this.tenantId,
      academyId: data.academyId.present ? data.academyId.value : this.academyId,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      updatedBy: data.updatedBy.present ? data.updatedBy.value : this.updatedBy,
      name: data.name.present ? data.name.value : this.name,
      birthDate: data.birthDate.present ? data.birthDate.value : this.birthDate,
      phone: data.phone.present ? data.phone.value : this.phone,
      guardianName: data.guardianName.present
          ? data.guardianName.value
          : this.guardianName,
      guardianRelation: data.guardianRelation.present
          ? data.guardianRelation.value
          : this.guardianRelation,
      guardianJob: data.guardianJob.present
          ? data.guardianJob.value
          : this.guardianJob,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      clientUpdatedAt: data.clientUpdatedAt.present
          ? data.clientUpdatedAt.value
          : this.clientUpdatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      lastSyncError: data.lastSyncError.present
          ? data.lastSyncError.value
          : this.lastSyncError,
      version: data.version.present ? data.version.value : this.version,
      rawJson: data.rawJson.present ? data.rawJson.value : this.rawJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalPlayer(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('tenantId: $tenantId, ')
          ..write('academyId: $academyId, ')
          ..write('ownerId: $ownerId, ')
          ..write('userId: $userId, ')
          ..write('createdBy: $createdBy, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('name: $name, ')
          ..write('birthDate: $birthDate, ')
          ..write('phone: $phone, ')
          ..write('guardianName: $guardianName, ')
          ..write('guardianRelation: $guardianRelation, ')
          ..write('guardianJob: $guardianJob, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('clientUpdatedAt: $clientUpdatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncError: $lastSyncError, ')
          ..write('version: $version, ')
          ..write('rawJson: $rawJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    localId,
    serverId,
    tenantId,
    academyId,
    ownerId,
    userId,
    createdBy,
    updatedBy,
    name,
    birthDate,
    phone,
    guardianName,
    guardianRelation,
    guardianJob,
    isActive,
    createdAt,
    updatedAt,
    clientUpdatedAt,
    deletedAt,
    syncStatus,
    lastSyncError,
    version,
    rawJson,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalPlayer &&
          other.localId == this.localId &&
          other.serverId == this.serverId &&
          other.tenantId == this.tenantId &&
          other.academyId == this.academyId &&
          other.ownerId == this.ownerId &&
          other.userId == this.userId &&
          other.createdBy == this.createdBy &&
          other.updatedBy == this.updatedBy &&
          other.name == this.name &&
          other.birthDate == this.birthDate &&
          other.phone == this.phone &&
          other.guardianName == this.guardianName &&
          other.guardianRelation == this.guardianRelation &&
          other.guardianJob == this.guardianJob &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.clientUpdatedAt == this.clientUpdatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncError == this.lastSyncError &&
          other.version == this.version &&
          other.rawJson == this.rawJson);
}

class LocalPlayersCompanion extends UpdateCompanion<LocalPlayer> {
  final Value<String> localId;
  final Value<String?> serverId;
  final Value<String?> tenantId;
  final Value<String?> academyId;
  final Value<String> ownerId;
  final Value<String> userId;
  final Value<String?> createdBy;
  final Value<String?> updatedBy;
  final Value<String> name;
  final Value<DateTime> birthDate;
  final Value<String> phone;
  final Value<String> guardianName;
  final Value<String> guardianRelation;
  final Value<String?> guardianJob;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime> clientUpdatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> lastSyncError;
  final Value<int?> version;
  final Value<String?> rawJson;
  final Value<int> rowid;
  const LocalPlayersCompanion({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.academyId = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.name = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.phone = const Value.absent(),
    this.guardianName = const Value.absent(),
    this.guardianRelation = const Value.absent(),
    this.guardianJob = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.clientUpdatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncError = const Value.absent(),
    this.version = const Value.absent(),
    this.rawJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalPlayersCompanion.insert({
    required String localId,
    this.serverId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.academyId = const Value.absent(),
    required String ownerId,
    required String userId,
    this.createdBy = const Value.absent(),
    this.updatedBy = const Value.absent(),
    required String name,
    required DateTime birthDate,
    required String phone,
    required String guardianName,
    required String guardianRelation,
    this.guardianJob = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime clientUpdatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncError = const Value.absent(),
    this.version = const Value.absent(),
    this.rawJson = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : localId = Value(localId),
       ownerId = Value(ownerId),
       userId = Value(userId),
       name = Value(name),
       birthDate = Value(birthDate),
       phone = Value(phone),
       guardianName = Value(guardianName),
       guardianRelation = Value(guardianRelation),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       clientUpdatedAt = Value(clientUpdatedAt);
  static Insertable<LocalPlayer> custom({
    Expression<String>? localId,
    Expression<String>? serverId,
    Expression<String>? tenantId,
    Expression<String>? academyId,
    Expression<String>? ownerId,
    Expression<String>? userId,
    Expression<String>? createdBy,
    Expression<String>? updatedBy,
    Expression<String>? name,
    Expression<DateTime>? birthDate,
    Expression<String>? phone,
    Expression<String>? guardianName,
    Expression<String>? guardianRelation,
    Expression<String>? guardianJob,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? clientUpdatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? lastSyncError,
    Expression<int>? version,
    Expression<String>? rawJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (serverId != null) 'server_id': serverId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (academyId != null) 'academy_id': academyId,
      if (ownerId != null) 'owner_id': ownerId,
      if (userId != null) 'user_id': userId,
      if (createdBy != null) 'created_by': createdBy,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (name != null) 'name': name,
      if (birthDate != null) 'birth_date': birthDate,
      if (phone != null) 'phone': phone,
      if (guardianName != null) 'guardian_name': guardianName,
      if (guardianRelation != null) 'guardian_relation': guardianRelation,
      if (guardianJob != null) 'guardian_job': guardianJob,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (clientUpdatedAt != null) 'client_updated_at': clientUpdatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncError != null) 'last_sync_error': lastSyncError,
      if (version != null) 'version': version,
      if (rawJson != null) 'raw_json': rawJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalPlayersCompanion copyWith({
    Value<String>? localId,
    Value<String?>? serverId,
    Value<String?>? tenantId,
    Value<String?>? academyId,
    Value<String>? ownerId,
    Value<String>? userId,
    Value<String?>? createdBy,
    Value<String?>? updatedBy,
    Value<String>? name,
    Value<DateTime>? birthDate,
    Value<String>? phone,
    Value<String>? guardianName,
    Value<String>? guardianRelation,
    Value<String?>? guardianJob,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime>? clientUpdatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? lastSyncError,
    Value<int?>? version,
    Value<String?>? rawJson,
    Value<int>? rowid,
  }) {
    return LocalPlayersCompanion(
      localId: localId ?? this.localId,
      serverId: serverId ?? this.serverId,
      tenantId: tenantId ?? this.tenantId,
      academyId: academyId ?? this.academyId,
      ownerId: ownerId ?? this.ownerId,
      userId: userId ?? this.userId,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      name: name ?? this.name,
      birthDate: birthDate ?? this.birthDate,
      phone: phone ?? this.phone,
      guardianName: guardianName ?? this.guardianName,
      guardianRelation: guardianRelation ?? this.guardianRelation,
      guardianJob: guardianJob ?? this.guardianJob,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      clientUpdatedAt: clientUpdatedAt ?? this.clientUpdatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncError: lastSyncError ?? this.lastSyncError,
      version: version ?? this.version,
      rawJson: rawJson ?? this.rawJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<String>(localId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (academyId.present) {
      map['academy_id'] = Variable<String>(academyId.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (guardianName.present) {
      map['guardian_name'] = Variable<String>(guardianName.value);
    }
    if (guardianRelation.present) {
      map['guardian_relation'] = Variable<String>(guardianRelation.value);
    }
    if (guardianJob.present) {
      map['guardian_job'] = Variable<String>(guardianJob.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (clientUpdatedAt.present) {
      map['client_updated_at'] = Variable<DateTime>(clientUpdatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncError.present) {
      map['last_sync_error'] = Variable<String>(lastSyncError.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (rawJson.present) {
      map['raw_json'] = Variable<String>(rawJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalPlayersCompanion(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('tenantId: $tenantId, ')
          ..write('academyId: $academyId, ')
          ..write('ownerId: $ownerId, ')
          ..write('userId: $userId, ')
          ..write('createdBy: $createdBy, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('name: $name, ')
          ..write('birthDate: $birthDate, ')
          ..write('phone: $phone, ')
          ..write('guardianName: $guardianName, ')
          ..write('guardianRelation: $guardianRelation, ')
          ..write('guardianJob: $guardianJob, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('clientUpdatedAt: $clientUpdatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncError: $lastSyncError, ')
          ..write('version: $version, ')
          ..write('rawJson: $rawJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalSubscriptionsTable extends LocalSubscriptions
    with TableInfo<$LocalSubscriptionsTable, LocalSubscription> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalSubscriptionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<String> localId = GeneratedColumn<String>(
    'local_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tenantIdMeta = const VerificationMeta(
    'tenantId',
  );
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
    'tenant_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _academyIdMeta = const VerificationMeta(
    'academyId',
  );
  @override
  late final GeneratedColumn<String> academyId = GeneratedColumn<String>(
    'academy_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdByMeta = const VerificationMeta(
    'createdBy',
  );
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
    'created_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByMeta = const VerificationMeta(
    'updatedBy',
  );
  @override
  late final GeneratedColumn<String> updatedBy = GeneratedColumn<String>(
    'updated_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _playerLocalIdMeta = const VerificationMeta(
    'playerLocalId',
  );
  @override
  late final GeneratedColumn<String> playerLocalId = GeneratedColumn<String>(
    'player_local_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _playerServerIdMeta = const VerificationMeta(
    'playerServerId',
  );
  @override
  late final GeneratedColumn<String> playerServerId = GeneratedColumn<String>(
    'player_server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientUpdatedAtMeta = const VerificationMeta(
    'clientUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> clientUpdatedAt =
      GeneratedColumn<DateTime>(
        'client_updated_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('synced'),
  );
  static const VerificationMeta _lastSyncErrorMeta = const VerificationMeta(
    'lastSyncError',
  );
  @override
  late final GeneratedColumn<String> lastSyncError = GeneratedColumn<String>(
    'last_sync_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rawJsonMeta = const VerificationMeta(
    'rawJson',
  );
  @override
  late final GeneratedColumn<String> rawJson = GeneratedColumn<String>(
    'raw_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    serverId,
    tenantId,
    academyId,
    ownerId,
    userId,
    createdBy,
    updatedBy,
    playerLocalId,
    playerServerId,
    amount,
    startDate,
    endDate,
    notes,
    createdAt,
    updatedAt,
    clientUpdatedAt,
    deletedAt,
    syncStatus,
    lastSyncError,
    version,
    rawJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_subscriptions';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalSubscription> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    } else if (isInserting) {
      context.missing(_localIdMeta);
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    }
    if (data.containsKey('tenant_id')) {
      context.handle(
        _tenantIdMeta,
        tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta),
      );
    }
    if (data.containsKey('academy_id')) {
      context.handle(
        _academyIdMeta,
        academyId.isAcceptableOrUnknown(data['academy_id']!, _academyIdMeta),
      );
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_by')) {
      context.handle(
        _createdByMeta,
        createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta),
      );
    }
    if (data.containsKey('updated_by')) {
      context.handle(
        _updatedByMeta,
        updatedBy.isAcceptableOrUnknown(data['updated_by']!, _updatedByMeta),
      );
    }
    if (data.containsKey('player_local_id')) {
      context.handle(
        _playerLocalIdMeta,
        playerLocalId.isAcceptableOrUnknown(
          data['player_local_id']!,
          _playerLocalIdMeta,
        ),
      );
    }
    if (data.containsKey('player_server_id')) {
      context.handle(
        _playerServerIdMeta,
        playerServerId.isAcceptableOrUnknown(
          data['player_server_id']!,
          _playerServerIdMeta,
        ),
      );
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('client_updated_at')) {
      context.handle(
        _clientUpdatedAtMeta,
        clientUpdatedAt.isAcceptableOrUnknown(
          data['client_updated_at']!,
          _clientUpdatedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_clientUpdatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('last_sync_error')) {
      context.handle(
        _lastSyncErrorMeta,
        lastSyncError.isAcceptableOrUnknown(
          data['last_sync_error']!,
          _lastSyncErrorMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('raw_json')) {
      context.handle(
        _rawJsonMeta,
        rawJson.isAcceptableOrUnknown(data['raw_json']!, _rawJsonMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  LocalSubscription map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalSubscription(
      localId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_id'],
      )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      ),
      tenantId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_id'],
      ),
      academyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}academy_id'],
      ),
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by'],
      ),
      updatedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by'],
      ),
      playerLocalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}player_local_id'],
      ),
      playerServerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}player_server_id'],
      ),
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      clientUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}client_updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      lastSyncError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_sync_error'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      ),
      rawJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_json'],
      ),
    );
  }

  @override
  $LocalSubscriptionsTable createAlias(String alias) {
    return $LocalSubscriptionsTable(attachedDatabase, alias);
  }
}

class LocalSubscription extends DataClass
    implements Insertable<LocalSubscription> {
  final String localId;
  final String? serverId;
  final String? tenantId;
  final String? academyId;
  final String ownerId;
  final String userId;
  final String? createdBy;
  final String? updatedBy;
  final String? playerLocalId;
  final String? playerServerId;
  final double amount;
  final DateTime startDate;
  final DateTime endDate;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime clientUpdatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? lastSyncError;
  final int? version;
  final String? rawJson;
  const LocalSubscription({
    required this.localId,
    this.serverId,
    this.tenantId,
    this.academyId,
    required this.ownerId,
    required this.userId,
    this.createdBy,
    this.updatedBy,
    this.playerLocalId,
    this.playerServerId,
    required this.amount,
    required this.startDate,
    required this.endDate,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.clientUpdatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.lastSyncError,
    this.version,
    this.rawJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<String>(localId);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<String>(serverId);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || academyId != null) {
      map['academy_id'] = Variable<String>(academyId);
    }
    map['owner_id'] = Variable<String>(ownerId);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || playerLocalId != null) {
      map['player_local_id'] = Variable<String>(playerLocalId);
    }
    if (!nullToAbsent || playerServerId != null) {
      map['player_server_id'] = Variable<String>(playerServerId);
    }
    map['amount'] = Variable<double>(amount);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['client_updated_at'] = Variable<DateTime>(clientUpdatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncError != null) {
      map['last_sync_error'] = Variable<String>(lastSyncError);
    }
    if (!nullToAbsent || version != null) {
      map['version'] = Variable<int>(version);
    }
    if (!nullToAbsent || rawJson != null) {
      map['raw_json'] = Variable<String>(rawJson);
    }
    return map;
  }

  LocalSubscriptionsCompanion toCompanion(bool nullToAbsent) {
    return LocalSubscriptionsCompanion(
      localId: Value(localId),
      serverId: serverId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverId),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      academyId: academyId == null && nullToAbsent
          ? const Value.absent()
          : Value(academyId),
      ownerId: Value(ownerId),
      userId: Value(userId),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      playerLocalId: playerLocalId == null && nullToAbsent
          ? const Value.absent()
          : Value(playerLocalId),
      playerServerId: playerServerId == null && nullToAbsent
          ? const Value.absent()
          : Value(playerServerId),
      amount: Value(amount),
      startDate: Value(startDate),
      endDate: Value(endDate),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      clientUpdatedAt: Value(clientUpdatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      lastSyncError: lastSyncError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncError),
      version: version == null && nullToAbsent
          ? const Value.absent()
          : Value(version),
      rawJson: rawJson == null && nullToAbsent
          ? const Value.absent()
          : Value(rawJson),
    );
  }

  factory LocalSubscription.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalSubscription(
      localId: serializer.fromJson<String>(json['localId']),
      serverId: serializer.fromJson<String?>(json['serverId']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      academyId: serializer.fromJson<String?>(json['academyId']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      userId: serializer.fromJson<String>(json['userId']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
      updatedBy: serializer.fromJson<String?>(json['updatedBy']),
      playerLocalId: serializer.fromJson<String?>(json['playerLocalId']),
      playerServerId: serializer.fromJson<String?>(json['playerServerId']),
      amount: serializer.fromJson<double>(json['amount']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      clientUpdatedAt: serializer.fromJson<DateTime>(json['clientUpdatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncError: serializer.fromJson<String?>(json['lastSyncError']),
      version: serializer.fromJson<int?>(json['version']),
      rawJson: serializer.fromJson<String?>(json['rawJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<String>(localId),
      'serverId': serializer.toJson<String?>(serverId),
      'tenantId': serializer.toJson<String?>(tenantId),
      'academyId': serializer.toJson<String?>(academyId),
      'ownerId': serializer.toJson<String>(ownerId),
      'userId': serializer.toJson<String>(userId),
      'createdBy': serializer.toJson<String?>(createdBy),
      'updatedBy': serializer.toJson<String?>(updatedBy),
      'playerLocalId': serializer.toJson<String?>(playerLocalId),
      'playerServerId': serializer.toJson<String?>(playerServerId),
      'amount': serializer.toJson<double>(amount),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'clientUpdatedAt': serializer.toJson<DateTime>(clientUpdatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncError': serializer.toJson<String?>(lastSyncError),
      'version': serializer.toJson<int?>(version),
      'rawJson': serializer.toJson<String?>(rawJson),
    };
  }

  LocalSubscription copyWith({
    String? localId,
    Value<String?> serverId = const Value.absent(),
    Value<String?> tenantId = const Value.absent(),
    Value<String?> academyId = const Value.absent(),
    String? ownerId,
    String? userId,
    Value<String?> createdBy = const Value.absent(),
    Value<String?> updatedBy = const Value.absent(),
    Value<String?> playerLocalId = const Value.absent(),
    Value<String?> playerServerId = const Value.absent(),
    double? amount,
    DateTime? startDate,
    DateTime? endDate,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? clientUpdatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> lastSyncError = const Value.absent(),
    Value<int?> version = const Value.absent(),
    Value<String?> rawJson = const Value.absent(),
  }) => LocalSubscription(
    localId: localId ?? this.localId,
    serverId: serverId.present ? serverId.value : this.serverId,
    tenantId: tenantId.present ? tenantId.value : this.tenantId,
    academyId: academyId.present ? academyId.value : this.academyId,
    ownerId: ownerId ?? this.ownerId,
    userId: userId ?? this.userId,
    createdBy: createdBy.present ? createdBy.value : this.createdBy,
    updatedBy: updatedBy.present ? updatedBy.value : this.updatedBy,
    playerLocalId: playerLocalId.present
        ? playerLocalId.value
        : this.playerLocalId,
    playerServerId: playerServerId.present
        ? playerServerId.value
        : this.playerServerId,
    amount: amount ?? this.amount,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    clientUpdatedAt: clientUpdatedAt ?? this.clientUpdatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    lastSyncError: lastSyncError.present
        ? lastSyncError.value
        : this.lastSyncError,
    version: version.present ? version.value : this.version,
    rawJson: rawJson.present ? rawJson.value : this.rawJson,
  );
  LocalSubscription copyWithCompanion(LocalSubscriptionsCompanion data) {
    return LocalSubscription(
      localId: data.localId.present ? data.localId.value : this.localId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      tenantId: data.tenantId.present ? data.tenantId.value : this.tenantId,
      academyId: data.academyId.present ? data.academyId.value : this.academyId,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      updatedBy: data.updatedBy.present ? data.updatedBy.value : this.updatedBy,
      playerLocalId: data.playerLocalId.present
          ? data.playerLocalId.value
          : this.playerLocalId,
      playerServerId: data.playerServerId.present
          ? data.playerServerId.value
          : this.playerServerId,
      amount: data.amount.present ? data.amount.value : this.amount,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      clientUpdatedAt: data.clientUpdatedAt.present
          ? data.clientUpdatedAt.value
          : this.clientUpdatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      lastSyncError: data.lastSyncError.present
          ? data.lastSyncError.value
          : this.lastSyncError,
      version: data.version.present ? data.version.value : this.version,
      rawJson: data.rawJson.present ? data.rawJson.value : this.rawJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalSubscription(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('tenantId: $tenantId, ')
          ..write('academyId: $academyId, ')
          ..write('ownerId: $ownerId, ')
          ..write('userId: $userId, ')
          ..write('createdBy: $createdBy, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('playerLocalId: $playerLocalId, ')
          ..write('playerServerId: $playerServerId, ')
          ..write('amount: $amount, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('clientUpdatedAt: $clientUpdatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncError: $lastSyncError, ')
          ..write('version: $version, ')
          ..write('rawJson: $rawJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    localId,
    serverId,
    tenantId,
    academyId,
    ownerId,
    userId,
    createdBy,
    updatedBy,
    playerLocalId,
    playerServerId,
    amount,
    startDate,
    endDate,
    notes,
    createdAt,
    updatedAt,
    clientUpdatedAt,
    deletedAt,
    syncStatus,
    lastSyncError,
    version,
    rawJson,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalSubscription &&
          other.localId == this.localId &&
          other.serverId == this.serverId &&
          other.tenantId == this.tenantId &&
          other.academyId == this.academyId &&
          other.ownerId == this.ownerId &&
          other.userId == this.userId &&
          other.createdBy == this.createdBy &&
          other.updatedBy == this.updatedBy &&
          other.playerLocalId == this.playerLocalId &&
          other.playerServerId == this.playerServerId &&
          other.amount == this.amount &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.clientUpdatedAt == this.clientUpdatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncError == this.lastSyncError &&
          other.version == this.version &&
          other.rawJson == this.rawJson);
}

class LocalSubscriptionsCompanion extends UpdateCompanion<LocalSubscription> {
  final Value<String> localId;
  final Value<String?> serverId;
  final Value<String?> tenantId;
  final Value<String?> academyId;
  final Value<String> ownerId;
  final Value<String> userId;
  final Value<String?> createdBy;
  final Value<String?> updatedBy;
  final Value<String?> playerLocalId;
  final Value<String?> playerServerId;
  final Value<double> amount;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime> clientUpdatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> lastSyncError;
  final Value<int?> version;
  final Value<String?> rawJson;
  final Value<int> rowid;
  const LocalSubscriptionsCompanion({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.academyId = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.playerLocalId = const Value.absent(),
    this.playerServerId = const Value.absent(),
    this.amount = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.clientUpdatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncError = const Value.absent(),
    this.version = const Value.absent(),
    this.rawJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalSubscriptionsCompanion.insert({
    required String localId,
    this.serverId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.academyId = const Value.absent(),
    required String ownerId,
    required String userId,
    this.createdBy = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.playerLocalId = const Value.absent(),
    this.playerServerId = const Value.absent(),
    required double amount,
    required DateTime startDate,
    required DateTime endDate,
    this.notes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime clientUpdatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncError = const Value.absent(),
    this.version = const Value.absent(),
    this.rawJson = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : localId = Value(localId),
       ownerId = Value(ownerId),
       userId = Value(userId),
       amount = Value(amount),
       startDate = Value(startDate),
       endDate = Value(endDate),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       clientUpdatedAt = Value(clientUpdatedAt);
  static Insertable<LocalSubscription> custom({
    Expression<String>? localId,
    Expression<String>? serverId,
    Expression<String>? tenantId,
    Expression<String>? academyId,
    Expression<String>? ownerId,
    Expression<String>? userId,
    Expression<String>? createdBy,
    Expression<String>? updatedBy,
    Expression<String>? playerLocalId,
    Expression<String>? playerServerId,
    Expression<double>? amount,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? clientUpdatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? lastSyncError,
    Expression<int>? version,
    Expression<String>? rawJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (serverId != null) 'server_id': serverId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (academyId != null) 'academy_id': academyId,
      if (ownerId != null) 'owner_id': ownerId,
      if (userId != null) 'user_id': userId,
      if (createdBy != null) 'created_by': createdBy,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (playerLocalId != null) 'player_local_id': playerLocalId,
      if (playerServerId != null) 'player_server_id': playerServerId,
      if (amount != null) 'amount': amount,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (clientUpdatedAt != null) 'client_updated_at': clientUpdatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncError != null) 'last_sync_error': lastSyncError,
      if (version != null) 'version': version,
      if (rawJson != null) 'raw_json': rawJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalSubscriptionsCompanion copyWith({
    Value<String>? localId,
    Value<String?>? serverId,
    Value<String?>? tenantId,
    Value<String?>? academyId,
    Value<String>? ownerId,
    Value<String>? userId,
    Value<String?>? createdBy,
    Value<String?>? updatedBy,
    Value<String?>? playerLocalId,
    Value<String?>? playerServerId,
    Value<double>? amount,
    Value<DateTime>? startDate,
    Value<DateTime>? endDate,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime>? clientUpdatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? lastSyncError,
    Value<int?>? version,
    Value<String?>? rawJson,
    Value<int>? rowid,
  }) {
    return LocalSubscriptionsCompanion(
      localId: localId ?? this.localId,
      serverId: serverId ?? this.serverId,
      tenantId: tenantId ?? this.tenantId,
      academyId: academyId ?? this.academyId,
      ownerId: ownerId ?? this.ownerId,
      userId: userId ?? this.userId,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      playerLocalId: playerLocalId ?? this.playerLocalId,
      playerServerId: playerServerId ?? this.playerServerId,
      amount: amount ?? this.amount,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      clientUpdatedAt: clientUpdatedAt ?? this.clientUpdatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncError: lastSyncError ?? this.lastSyncError,
      version: version ?? this.version,
      rawJson: rawJson ?? this.rawJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<String>(localId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (academyId.present) {
      map['academy_id'] = Variable<String>(academyId.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (playerLocalId.present) {
      map['player_local_id'] = Variable<String>(playerLocalId.value);
    }
    if (playerServerId.present) {
      map['player_server_id'] = Variable<String>(playerServerId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (clientUpdatedAt.present) {
      map['client_updated_at'] = Variable<DateTime>(clientUpdatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncError.present) {
      map['last_sync_error'] = Variable<String>(lastSyncError.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (rawJson.present) {
      map['raw_json'] = Variable<String>(rawJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalSubscriptionsCompanion(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('tenantId: $tenantId, ')
          ..write('academyId: $academyId, ')
          ..write('ownerId: $ownerId, ')
          ..write('userId: $userId, ')
          ..write('createdBy: $createdBy, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('playerLocalId: $playerLocalId, ')
          ..write('playerServerId: $playerServerId, ')
          ..write('amount: $amount, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('clientUpdatedAt: $clientUpdatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncError: $lastSyncError, ')
          ..write('version: $version, ')
          ..write('rawJson: $rawJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalEvaluationsTable extends LocalEvaluations
    with TableInfo<$LocalEvaluationsTable, LocalEvaluation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalEvaluationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<String> localId = GeneratedColumn<String>(
    'local_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tenantIdMeta = const VerificationMeta(
    'tenantId',
  );
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
    'tenant_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _academyIdMeta = const VerificationMeta(
    'academyId',
  );
  @override
  late final GeneratedColumn<String> academyId = GeneratedColumn<String>(
    'academy_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdByMeta = const VerificationMeta(
    'createdBy',
  );
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
    'created_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByMeta = const VerificationMeta(
    'updatedBy',
  );
  @override
  late final GeneratedColumn<String> updatedBy = GeneratedColumn<String>(
    'updated_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _playerLocalIdMeta = const VerificationMeta(
    'playerLocalId',
  );
  @override
  late final GeneratedColumn<String> playerLocalId = GeneratedColumn<String>(
    'player_local_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _playerServerIdMeta = const VerificationMeta(
    'playerServerId',
  );
  @override
  late final GeneratedColumn<String> playerServerId = GeneratedColumn<String>(
    'player_server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coachMeta = const VerificationMeta('coach');
  @override
  late final GeneratedColumn<String> coach = GeneratedColumn<String>(
    'coach',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _evaluationDateMeta = const VerificationMeta(
    'evaluationDate',
  );
  @override
  late final GeneratedColumn<DateTime> evaluationDate =
      GeneratedColumn<DateTime>(
        'evaluation_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _fitnessMeta = const VerificationMeta(
    'fitness',
  );
  @override
  late final GeneratedColumn<int> fitness = GeneratedColumn<int>(
    'fitness',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<int> speed = GeneratedColumn<int>(
    'speed',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _skillMeta = const VerificationMeta('skill');
  @override
  late final GeneratedColumn<int> skill = GeneratedColumn<int>(
    'skill',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _disciplineMeta = const VerificationMeta(
    'discipline',
  );
  @override
  late final GeneratedColumn<int> discipline = GeneratedColumn<int>(
    'discipline',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _teamworkMeta = const VerificationMeta(
    'teamwork',
  );
  @override
  late final GeneratedColumn<int> teamwork = GeneratedColumn<int>(
    'teamwork',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientUpdatedAtMeta = const VerificationMeta(
    'clientUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> clientUpdatedAt =
      GeneratedColumn<DateTime>(
        'client_updated_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('synced'),
  );
  static const VerificationMeta _lastSyncErrorMeta = const VerificationMeta(
    'lastSyncError',
  );
  @override
  late final GeneratedColumn<String> lastSyncError = GeneratedColumn<String>(
    'last_sync_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rawJsonMeta = const VerificationMeta(
    'rawJson',
  );
  @override
  late final GeneratedColumn<String> rawJson = GeneratedColumn<String>(
    'raw_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    serverId,
    tenantId,
    academyId,
    ownerId,
    userId,
    createdBy,
    updatedBy,
    playerLocalId,
    playerServerId,
    coach,
    evaluationDate,
    fitness,
    speed,
    skill,
    discipline,
    teamwork,
    notes,
    createdAt,
    updatedAt,
    clientUpdatedAt,
    deletedAt,
    syncStatus,
    lastSyncError,
    version,
    rawJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_evaluations';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalEvaluation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    } else if (isInserting) {
      context.missing(_localIdMeta);
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    }
    if (data.containsKey('tenant_id')) {
      context.handle(
        _tenantIdMeta,
        tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta),
      );
    }
    if (data.containsKey('academy_id')) {
      context.handle(
        _academyIdMeta,
        academyId.isAcceptableOrUnknown(data['academy_id']!, _academyIdMeta),
      );
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_by')) {
      context.handle(
        _createdByMeta,
        createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta),
      );
    }
    if (data.containsKey('updated_by')) {
      context.handle(
        _updatedByMeta,
        updatedBy.isAcceptableOrUnknown(data['updated_by']!, _updatedByMeta),
      );
    }
    if (data.containsKey('player_local_id')) {
      context.handle(
        _playerLocalIdMeta,
        playerLocalId.isAcceptableOrUnknown(
          data['player_local_id']!,
          _playerLocalIdMeta,
        ),
      );
    }
    if (data.containsKey('player_server_id')) {
      context.handle(
        _playerServerIdMeta,
        playerServerId.isAcceptableOrUnknown(
          data['player_server_id']!,
          _playerServerIdMeta,
        ),
      );
    }
    if (data.containsKey('coach')) {
      context.handle(
        _coachMeta,
        coach.isAcceptableOrUnknown(data['coach']!, _coachMeta),
      );
    } else if (isInserting) {
      context.missing(_coachMeta);
    }
    if (data.containsKey('evaluation_date')) {
      context.handle(
        _evaluationDateMeta,
        evaluationDate.isAcceptableOrUnknown(
          data['evaluation_date']!,
          _evaluationDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_evaluationDateMeta);
    }
    if (data.containsKey('fitness')) {
      context.handle(
        _fitnessMeta,
        fitness.isAcceptableOrUnknown(data['fitness']!, _fitnessMeta),
      );
    } else if (isInserting) {
      context.missing(_fitnessMeta);
    }
    if (data.containsKey('speed')) {
      context.handle(
        _speedMeta,
        speed.isAcceptableOrUnknown(data['speed']!, _speedMeta),
      );
    } else if (isInserting) {
      context.missing(_speedMeta);
    }
    if (data.containsKey('skill')) {
      context.handle(
        _skillMeta,
        skill.isAcceptableOrUnknown(data['skill']!, _skillMeta),
      );
    } else if (isInserting) {
      context.missing(_skillMeta);
    }
    if (data.containsKey('discipline')) {
      context.handle(
        _disciplineMeta,
        discipline.isAcceptableOrUnknown(data['discipline']!, _disciplineMeta),
      );
    } else if (isInserting) {
      context.missing(_disciplineMeta);
    }
    if (data.containsKey('teamwork')) {
      context.handle(
        _teamworkMeta,
        teamwork.isAcceptableOrUnknown(data['teamwork']!, _teamworkMeta),
      );
    } else if (isInserting) {
      context.missing(_teamworkMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('client_updated_at')) {
      context.handle(
        _clientUpdatedAtMeta,
        clientUpdatedAt.isAcceptableOrUnknown(
          data['client_updated_at']!,
          _clientUpdatedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_clientUpdatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('last_sync_error')) {
      context.handle(
        _lastSyncErrorMeta,
        lastSyncError.isAcceptableOrUnknown(
          data['last_sync_error']!,
          _lastSyncErrorMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('raw_json')) {
      context.handle(
        _rawJsonMeta,
        rawJson.isAcceptableOrUnknown(data['raw_json']!, _rawJsonMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  LocalEvaluation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalEvaluation(
      localId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_id'],
      )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      ),
      tenantId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_id'],
      ),
      academyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}academy_id'],
      ),
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by'],
      ),
      updatedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by'],
      ),
      playerLocalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}player_local_id'],
      ),
      playerServerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}player_server_id'],
      ),
      coach: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}coach'],
      )!,
      evaluationDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}evaluation_date'],
      )!,
      fitness: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fitness'],
      )!,
      speed: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}speed'],
      )!,
      skill: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}skill'],
      )!,
      discipline: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}discipline'],
      )!,
      teamwork: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}teamwork'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      clientUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}client_updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      lastSyncError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_sync_error'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      ),
      rawJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_json'],
      ),
    );
  }

  @override
  $LocalEvaluationsTable createAlias(String alias) {
    return $LocalEvaluationsTable(attachedDatabase, alias);
  }
}

class LocalEvaluation extends DataClass implements Insertable<LocalEvaluation> {
  final String localId;
  final String? serverId;
  final String? tenantId;
  final String? academyId;
  final String ownerId;
  final String userId;
  final String? createdBy;
  final String? updatedBy;
  final String? playerLocalId;
  final String? playerServerId;
  final String coach;
  final DateTime evaluationDate;
  final int fitness;
  final int speed;
  final int skill;
  final int discipline;
  final int teamwork;
  final String notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime clientUpdatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? lastSyncError;
  final int? version;
  final String? rawJson;
  const LocalEvaluation({
    required this.localId,
    this.serverId,
    this.tenantId,
    this.academyId,
    required this.ownerId,
    required this.userId,
    this.createdBy,
    this.updatedBy,
    this.playerLocalId,
    this.playerServerId,
    required this.coach,
    required this.evaluationDate,
    required this.fitness,
    required this.speed,
    required this.skill,
    required this.discipline,
    required this.teamwork,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.clientUpdatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.lastSyncError,
    this.version,
    this.rawJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<String>(localId);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<String>(serverId);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || academyId != null) {
      map['academy_id'] = Variable<String>(academyId);
    }
    map['owner_id'] = Variable<String>(ownerId);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || playerLocalId != null) {
      map['player_local_id'] = Variable<String>(playerLocalId);
    }
    if (!nullToAbsent || playerServerId != null) {
      map['player_server_id'] = Variable<String>(playerServerId);
    }
    map['coach'] = Variable<String>(coach);
    map['evaluation_date'] = Variable<DateTime>(evaluationDate);
    map['fitness'] = Variable<int>(fitness);
    map['speed'] = Variable<int>(speed);
    map['skill'] = Variable<int>(skill);
    map['discipline'] = Variable<int>(discipline);
    map['teamwork'] = Variable<int>(teamwork);
    map['notes'] = Variable<String>(notes);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['client_updated_at'] = Variable<DateTime>(clientUpdatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncError != null) {
      map['last_sync_error'] = Variable<String>(lastSyncError);
    }
    if (!nullToAbsent || version != null) {
      map['version'] = Variable<int>(version);
    }
    if (!nullToAbsent || rawJson != null) {
      map['raw_json'] = Variable<String>(rawJson);
    }
    return map;
  }

  LocalEvaluationsCompanion toCompanion(bool nullToAbsent) {
    return LocalEvaluationsCompanion(
      localId: Value(localId),
      serverId: serverId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverId),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      academyId: academyId == null && nullToAbsent
          ? const Value.absent()
          : Value(academyId),
      ownerId: Value(ownerId),
      userId: Value(userId),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      playerLocalId: playerLocalId == null && nullToAbsent
          ? const Value.absent()
          : Value(playerLocalId),
      playerServerId: playerServerId == null && nullToAbsent
          ? const Value.absent()
          : Value(playerServerId),
      coach: Value(coach),
      evaluationDate: Value(evaluationDate),
      fitness: Value(fitness),
      speed: Value(speed),
      skill: Value(skill),
      discipline: Value(discipline),
      teamwork: Value(teamwork),
      notes: Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      clientUpdatedAt: Value(clientUpdatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      lastSyncError: lastSyncError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncError),
      version: version == null && nullToAbsent
          ? const Value.absent()
          : Value(version),
      rawJson: rawJson == null && nullToAbsent
          ? const Value.absent()
          : Value(rawJson),
    );
  }

  factory LocalEvaluation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalEvaluation(
      localId: serializer.fromJson<String>(json['localId']),
      serverId: serializer.fromJson<String?>(json['serverId']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      academyId: serializer.fromJson<String?>(json['academyId']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      userId: serializer.fromJson<String>(json['userId']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
      updatedBy: serializer.fromJson<String?>(json['updatedBy']),
      playerLocalId: serializer.fromJson<String?>(json['playerLocalId']),
      playerServerId: serializer.fromJson<String?>(json['playerServerId']),
      coach: serializer.fromJson<String>(json['coach']),
      evaluationDate: serializer.fromJson<DateTime>(json['evaluationDate']),
      fitness: serializer.fromJson<int>(json['fitness']),
      speed: serializer.fromJson<int>(json['speed']),
      skill: serializer.fromJson<int>(json['skill']),
      discipline: serializer.fromJson<int>(json['discipline']),
      teamwork: serializer.fromJson<int>(json['teamwork']),
      notes: serializer.fromJson<String>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      clientUpdatedAt: serializer.fromJson<DateTime>(json['clientUpdatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncError: serializer.fromJson<String?>(json['lastSyncError']),
      version: serializer.fromJson<int?>(json['version']),
      rawJson: serializer.fromJson<String?>(json['rawJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<String>(localId),
      'serverId': serializer.toJson<String?>(serverId),
      'tenantId': serializer.toJson<String?>(tenantId),
      'academyId': serializer.toJson<String?>(academyId),
      'ownerId': serializer.toJson<String>(ownerId),
      'userId': serializer.toJson<String>(userId),
      'createdBy': serializer.toJson<String?>(createdBy),
      'updatedBy': serializer.toJson<String?>(updatedBy),
      'playerLocalId': serializer.toJson<String?>(playerLocalId),
      'playerServerId': serializer.toJson<String?>(playerServerId),
      'coach': serializer.toJson<String>(coach),
      'evaluationDate': serializer.toJson<DateTime>(evaluationDate),
      'fitness': serializer.toJson<int>(fitness),
      'speed': serializer.toJson<int>(speed),
      'skill': serializer.toJson<int>(skill),
      'discipline': serializer.toJson<int>(discipline),
      'teamwork': serializer.toJson<int>(teamwork),
      'notes': serializer.toJson<String>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'clientUpdatedAt': serializer.toJson<DateTime>(clientUpdatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncError': serializer.toJson<String?>(lastSyncError),
      'version': serializer.toJson<int?>(version),
      'rawJson': serializer.toJson<String?>(rawJson),
    };
  }

  LocalEvaluation copyWith({
    String? localId,
    Value<String?> serverId = const Value.absent(),
    Value<String?> tenantId = const Value.absent(),
    Value<String?> academyId = const Value.absent(),
    String? ownerId,
    String? userId,
    Value<String?> createdBy = const Value.absent(),
    Value<String?> updatedBy = const Value.absent(),
    Value<String?> playerLocalId = const Value.absent(),
    Value<String?> playerServerId = const Value.absent(),
    String? coach,
    DateTime? evaluationDate,
    int? fitness,
    int? speed,
    int? skill,
    int? discipline,
    int? teamwork,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? clientUpdatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> lastSyncError = const Value.absent(),
    Value<int?> version = const Value.absent(),
    Value<String?> rawJson = const Value.absent(),
  }) => LocalEvaluation(
    localId: localId ?? this.localId,
    serverId: serverId.present ? serverId.value : this.serverId,
    tenantId: tenantId.present ? tenantId.value : this.tenantId,
    academyId: academyId.present ? academyId.value : this.academyId,
    ownerId: ownerId ?? this.ownerId,
    userId: userId ?? this.userId,
    createdBy: createdBy.present ? createdBy.value : this.createdBy,
    updatedBy: updatedBy.present ? updatedBy.value : this.updatedBy,
    playerLocalId: playerLocalId.present
        ? playerLocalId.value
        : this.playerLocalId,
    playerServerId: playerServerId.present
        ? playerServerId.value
        : this.playerServerId,
    coach: coach ?? this.coach,
    evaluationDate: evaluationDate ?? this.evaluationDate,
    fitness: fitness ?? this.fitness,
    speed: speed ?? this.speed,
    skill: skill ?? this.skill,
    discipline: discipline ?? this.discipline,
    teamwork: teamwork ?? this.teamwork,
    notes: notes ?? this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    clientUpdatedAt: clientUpdatedAt ?? this.clientUpdatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    lastSyncError: lastSyncError.present
        ? lastSyncError.value
        : this.lastSyncError,
    version: version.present ? version.value : this.version,
    rawJson: rawJson.present ? rawJson.value : this.rawJson,
  );
  LocalEvaluation copyWithCompanion(LocalEvaluationsCompanion data) {
    return LocalEvaluation(
      localId: data.localId.present ? data.localId.value : this.localId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      tenantId: data.tenantId.present ? data.tenantId.value : this.tenantId,
      academyId: data.academyId.present ? data.academyId.value : this.academyId,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      updatedBy: data.updatedBy.present ? data.updatedBy.value : this.updatedBy,
      playerLocalId: data.playerLocalId.present
          ? data.playerLocalId.value
          : this.playerLocalId,
      playerServerId: data.playerServerId.present
          ? data.playerServerId.value
          : this.playerServerId,
      coach: data.coach.present ? data.coach.value : this.coach,
      evaluationDate: data.evaluationDate.present
          ? data.evaluationDate.value
          : this.evaluationDate,
      fitness: data.fitness.present ? data.fitness.value : this.fitness,
      speed: data.speed.present ? data.speed.value : this.speed,
      skill: data.skill.present ? data.skill.value : this.skill,
      discipline: data.discipline.present
          ? data.discipline.value
          : this.discipline,
      teamwork: data.teamwork.present ? data.teamwork.value : this.teamwork,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      clientUpdatedAt: data.clientUpdatedAt.present
          ? data.clientUpdatedAt.value
          : this.clientUpdatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      lastSyncError: data.lastSyncError.present
          ? data.lastSyncError.value
          : this.lastSyncError,
      version: data.version.present ? data.version.value : this.version,
      rawJson: data.rawJson.present ? data.rawJson.value : this.rawJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalEvaluation(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('tenantId: $tenantId, ')
          ..write('academyId: $academyId, ')
          ..write('ownerId: $ownerId, ')
          ..write('userId: $userId, ')
          ..write('createdBy: $createdBy, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('playerLocalId: $playerLocalId, ')
          ..write('playerServerId: $playerServerId, ')
          ..write('coach: $coach, ')
          ..write('evaluationDate: $evaluationDate, ')
          ..write('fitness: $fitness, ')
          ..write('speed: $speed, ')
          ..write('skill: $skill, ')
          ..write('discipline: $discipline, ')
          ..write('teamwork: $teamwork, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('clientUpdatedAt: $clientUpdatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncError: $lastSyncError, ')
          ..write('version: $version, ')
          ..write('rawJson: $rawJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    localId,
    serverId,
    tenantId,
    academyId,
    ownerId,
    userId,
    createdBy,
    updatedBy,
    playerLocalId,
    playerServerId,
    coach,
    evaluationDate,
    fitness,
    speed,
    skill,
    discipline,
    teamwork,
    notes,
    createdAt,
    updatedAt,
    clientUpdatedAt,
    deletedAt,
    syncStatus,
    lastSyncError,
    version,
    rawJson,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalEvaluation &&
          other.localId == this.localId &&
          other.serverId == this.serverId &&
          other.tenantId == this.tenantId &&
          other.academyId == this.academyId &&
          other.ownerId == this.ownerId &&
          other.userId == this.userId &&
          other.createdBy == this.createdBy &&
          other.updatedBy == this.updatedBy &&
          other.playerLocalId == this.playerLocalId &&
          other.playerServerId == this.playerServerId &&
          other.coach == this.coach &&
          other.evaluationDate == this.evaluationDate &&
          other.fitness == this.fitness &&
          other.speed == this.speed &&
          other.skill == this.skill &&
          other.discipline == this.discipline &&
          other.teamwork == this.teamwork &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.clientUpdatedAt == this.clientUpdatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncError == this.lastSyncError &&
          other.version == this.version &&
          other.rawJson == this.rawJson);
}

class LocalEvaluationsCompanion extends UpdateCompanion<LocalEvaluation> {
  final Value<String> localId;
  final Value<String?> serverId;
  final Value<String?> tenantId;
  final Value<String?> academyId;
  final Value<String> ownerId;
  final Value<String> userId;
  final Value<String?> createdBy;
  final Value<String?> updatedBy;
  final Value<String?> playerLocalId;
  final Value<String?> playerServerId;
  final Value<String> coach;
  final Value<DateTime> evaluationDate;
  final Value<int> fitness;
  final Value<int> speed;
  final Value<int> skill;
  final Value<int> discipline;
  final Value<int> teamwork;
  final Value<String> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime> clientUpdatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> lastSyncError;
  final Value<int?> version;
  final Value<String?> rawJson;
  final Value<int> rowid;
  const LocalEvaluationsCompanion({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.academyId = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.playerLocalId = const Value.absent(),
    this.playerServerId = const Value.absent(),
    this.coach = const Value.absent(),
    this.evaluationDate = const Value.absent(),
    this.fitness = const Value.absent(),
    this.speed = const Value.absent(),
    this.skill = const Value.absent(),
    this.discipline = const Value.absent(),
    this.teamwork = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.clientUpdatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncError = const Value.absent(),
    this.version = const Value.absent(),
    this.rawJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalEvaluationsCompanion.insert({
    required String localId,
    this.serverId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.academyId = const Value.absent(),
    required String ownerId,
    required String userId,
    this.createdBy = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.playerLocalId = const Value.absent(),
    this.playerServerId = const Value.absent(),
    required String coach,
    required DateTime evaluationDate,
    required int fitness,
    required int speed,
    required int skill,
    required int discipline,
    required int teamwork,
    this.notes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime clientUpdatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncError = const Value.absent(),
    this.version = const Value.absent(),
    this.rawJson = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : localId = Value(localId),
       ownerId = Value(ownerId),
       userId = Value(userId),
       coach = Value(coach),
       evaluationDate = Value(evaluationDate),
       fitness = Value(fitness),
       speed = Value(speed),
       skill = Value(skill),
       discipline = Value(discipline),
       teamwork = Value(teamwork),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       clientUpdatedAt = Value(clientUpdatedAt);
  static Insertable<LocalEvaluation> custom({
    Expression<String>? localId,
    Expression<String>? serverId,
    Expression<String>? tenantId,
    Expression<String>? academyId,
    Expression<String>? ownerId,
    Expression<String>? userId,
    Expression<String>? createdBy,
    Expression<String>? updatedBy,
    Expression<String>? playerLocalId,
    Expression<String>? playerServerId,
    Expression<String>? coach,
    Expression<DateTime>? evaluationDate,
    Expression<int>? fitness,
    Expression<int>? speed,
    Expression<int>? skill,
    Expression<int>? discipline,
    Expression<int>? teamwork,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? clientUpdatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? lastSyncError,
    Expression<int>? version,
    Expression<String>? rawJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (serverId != null) 'server_id': serverId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (academyId != null) 'academy_id': academyId,
      if (ownerId != null) 'owner_id': ownerId,
      if (userId != null) 'user_id': userId,
      if (createdBy != null) 'created_by': createdBy,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (playerLocalId != null) 'player_local_id': playerLocalId,
      if (playerServerId != null) 'player_server_id': playerServerId,
      if (coach != null) 'coach': coach,
      if (evaluationDate != null) 'evaluation_date': evaluationDate,
      if (fitness != null) 'fitness': fitness,
      if (speed != null) 'speed': speed,
      if (skill != null) 'skill': skill,
      if (discipline != null) 'discipline': discipline,
      if (teamwork != null) 'teamwork': teamwork,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (clientUpdatedAt != null) 'client_updated_at': clientUpdatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncError != null) 'last_sync_error': lastSyncError,
      if (version != null) 'version': version,
      if (rawJson != null) 'raw_json': rawJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalEvaluationsCompanion copyWith({
    Value<String>? localId,
    Value<String?>? serverId,
    Value<String?>? tenantId,
    Value<String?>? academyId,
    Value<String>? ownerId,
    Value<String>? userId,
    Value<String?>? createdBy,
    Value<String?>? updatedBy,
    Value<String?>? playerLocalId,
    Value<String?>? playerServerId,
    Value<String>? coach,
    Value<DateTime>? evaluationDate,
    Value<int>? fitness,
    Value<int>? speed,
    Value<int>? skill,
    Value<int>? discipline,
    Value<int>? teamwork,
    Value<String>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime>? clientUpdatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? lastSyncError,
    Value<int?>? version,
    Value<String?>? rawJson,
    Value<int>? rowid,
  }) {
    return LocalEvaluationsCompanion(
      localId: localId ?? this.localId,
      serverId: serverId ?? this.serverId,
      tenantId: tenantId ?? this.tenantId,
      academyId: academyId ?? this.academyId,
      ownerId: ownerId ?? this.ownerId,
      userId: userId ?? this.userId,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      playerLocalId: playerLocalId ?? this.playerLocalId,
      playerServerId: playerServerId ?? this.playerServerId,
      coach: coach ?? this.coach,
      evaluationDate: evaluationDate ?? this.evaluationDate,
      fitness: fitness ?? this.fitness,
      speed: speed ?? this.speed,
      skill: skill ?? this.skill,
      discipline: discipline ?? this.discipline,
      teamwork: teamwork ?? this.teamwork,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      clientUpdatedAt: clientUpdatedAt ?? this.clientUpdatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncError: lastSyncError ?? this.lastSyncError,
      version: version ?? this.version,
      rawJson: rawJson ?? this.rawJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<String>(localId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (academyId.present) {
      map['academy_id'] = Variable<String>(academyId.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (playerLocalId.present) {
      map['player_local_id'] = Variable<String>(playerLocalId.value);
    }
    if (playerServerId.present) {
      map['player_server_id'] = Variable<String>(playerServerId.value);
    }
    if (coach.present) {
      map['coach'] = Variable<String>(coach.value);
    }
    if (evaluationDate.present) {
      map['evaluation_date'] = Variable<DateTime>(evaluationDate.value);
    }
    if (fitness.present) {
      map['fitness'] = Variable<int>(fitness.value);
    }
    if (speed.present) {
      map['speed'] = Variable<int>(speed.value);
    }
    if (skill.present) {
      map['skill'] = Variable<int>(skill.value);
    }
    if (discipline.present) {
      map['discipline'] = Variable<int>(discipline.value);
    }
    if (teamwork.present) {
      map['teamwork'] = Variable<int>(teamwork.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (clientUpdatedAt.present) {
      map['client_updated_at'] = Variable<DateTime>(clientUpdatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncError.present) {
      map['last_sync_error'] = Variable<String>(lastSyncError.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (rawJson.present) {
      map['raw_json'] = Variable<String>(rawJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalEvaluationsCompanion(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('tenantId: $tenantId, ')
          ..write('academyId: $academyId, ')
          ..write('ownerId: $ownerId, ')
          ..write('userId: $userId, ')
          ..write('createdBy: $createdBy, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('playerLocalId: $playerLocalId, ')
          ..write('playerServerId: $playerServerId, ')
          ..write('coach: $coach, ')
          ..write('evaluationDate: $evaluationDate, ')
          ..write('fitness: $fitness, ')
          ..write('speed: $speed, ')
          ..write('skill: $skill, ')
          ..write('discipline: $discipline, ')
          ..write('teamwork: $teamwork, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('clientUpdatedAt: $clientUpdatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncError: $lastSyncError, ')
          ..write('version: $version, ')
          ..write('rawJson: $rawJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalFinanceTransactionsTable extends LocalFinanceTransactions
    with TableInfo<$LocalFinanceTransactionsTable, LocalFinanceTransaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalFinanceTransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<String> localId = GeneratedColumn<String>(
    'local_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tenantIdMeta = const VerificationMeta(
    'tenantId',
  );
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
    'tenant_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _academyIdMeta = const VerificationMeta(
    'academyId',
  );
  @override
  late final GeneratedColumn<String> academyId = GeneratedColumn<String>(
    'academy_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdByMeta = const VerificationMeta(
    'createdBy',
  );
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
    'created_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByMeta = const VerificationMeta(
    'updatedBy',
  );
  @override
  late final GeneratedColumn<String> updatedBy = GeneratedColumn<String>(
    'updated_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientUpdatedAtMeta = const VerificationMeta(
    'clientUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> clientUpdatedAt =
      GeneratedColumn<DateTime>(
        'client_updated_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('synced'),
  );
  static const VerificationMeta _lastSyncErrorMeta = const VerificationMeta(
    'lastSyncError',
  );
  @override
  late final GeneratedColumn<String> lastSyncError = GeneratedColumn<String>(
    'last_sync_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rawJsonMeta = const VerificationMeta(
    'rawJson',
  );
  @override
  late final GeneratedColumn<String> rawJson = GeneratedColumn<String>(
    'raw_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    serverId,
    tenantId,
    academyId,
    ownerId,
    userId,
    createdBy,
    updatedBy,
    type,
    category,
    amount,
    description,
    occurredAt,
    createdAt,
    updatedAt,
    clientUpdatedAt,
    deletedAt,
    syncStatus,
    lastSyncError,
    version,
    rawJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_finance_transactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalFinanceTransaction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    } else if (isInserting) {
      context.missing(_localIdMeta);
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    }
    if (data.containsKey('tenant_id')) {
      context.handle(
        _tenantIdMeta,
        tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta),
      );
    }
    if (data.containsKey('academy_id')) {
      context.handle(
        _academyIdMeta,
        academyId.isAcceptableOrUnknown(data['academy_id']!, _academyIdMeta),
      );
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_by')) {
      context.handle(
        _createdByMeta,
        createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta),
      );
    }
    if (data.containsKey('updated_by')) {
      context.handle(
        _updatedByMeta,
        updatedBy.isAcceptableOrUnknown(data['updated_by']!, _updatedByMeta),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('client_updated_at')) {
      context.handle(
        _clientUpdatedAtMeta,
        clientUpdatedAt.isAcceptableOrUnknown(
          data['client_updated_at']!,
          _clientUpdatedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_clientUpdatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('last_sync_error')) {
      context.handle(
        _lastSyncErrorMeta,
        lastSyncError.isAcceptableOrUnknown(
          data['last_sync_error']!,
          _lastSyncErrorMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('raw_json')) {
      context.handle(
        _rawJsonMeta,
        rawJson.isAcceptableOrUnknown(data['raw_json']!, _rawJsonMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  LocalFinanceTransaction map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalFinanceTransaction(
      localId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_id'],
      )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      ),
      tenantId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_id'],
      ),
      academyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}academy_id'],
      ),
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by'],
      ),
      updatedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by'],
      ),
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_at'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      clientUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}client_updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      lastSyncError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_sync_error'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      ),
      rawJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_json'],
      ),
    );
  }

  @override
  $LocalFinanceTransactionsTable createAlias(String alias) {
    return $LocalFinanceTransactionsTable(attachedDatabase, alias);
  }
}

class LocalFinanceTransaction extends DataClass
    implements Insertable<LocalFinanceTransaction> {
  final String localId;
  final String? serverId;
  final String? tenantId;
  final String? academyId;
  final String ownerId;
  final String userId;
  final String? createdBy;
  final String? updatedBy;
  final String type;
  final String category;
  final double amount;
  final String description;
  final DateTime occurredAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime clientUpdatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? lastSyncError;
  final int? version;
  final String? rawJson;
  const LocalFinanceTransaction({
    required this.localId,
    this.serverId,
    this.tenantId,
    this.academyId,
    required this.ownerId,
    required this.userId,
    this.createdBy,
    this.updatedBy,
    required this.type,
    required this.category,
    required this.amount,
    required this.description,
    required this.occurredAt,
    required this.createdAt,
    required this.updatedAt,
    required this.clientUpdatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.lastSyncError,
    this.version,
    this.rawJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<String>(localId);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<String>(serverId);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || academyId != null) {
      map['academy_id'] = Variable<String>(academyId);
    }
    map['owner_id'] = Variable<String>(ownerId);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    map['type'] = Variable<String>(type);
    map['category'] = Variable<String>(category);
    map['amount'] = Variable<double>(amount);
    map['description'] = Variable<String>(description);
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['client_updated_at'] = Variable<DateTime>(clientUpdatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncError != null) {
      map['last_sync_error'] = Variable<String>(lastSyncError);
    }
    if (!nullToAbsent || version != null) {
      map['version'] = Variable<int>(version);
    }
    if (!nullToAbsent || rawJson != null) {
      map['raw_json'] = Variable<String>(rawJson);
    }
    return map;
  }

  LocalFinanceTransactionsCompanion toCompanion(bool nullToAbsent) {
    return LocalFinanceTransactionsCompanion(
      localId: Value(localId),
      serverId: serverId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverId),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      academyId: academyId == null && nullToAbsent
          ? const Value.absent()
          : Value(academyId),
      ownerId: Value(ownerId),
      userId: Value(userId),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      type: Value(type),
      category: Value(category),
      amount: Value(amount),
      description: Value(description),
      occurredAt: Value(occurredAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      clientUpdatedAt: Value(clientUpdatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      lastSyncError: lastSyncError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncError),
      version: version == null && nullToAbsent
          ? const Value.absent()
          : Value(version),
      rawJson: rawJson == null && nullToAbsent
          ? const Value.absent()
          : Value(rawJson),
    );
  }

  factory LocalFinanceTransaction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalFinanceTransaction(
      localId: serializer.fromJson<String>(json['localId']),
      serverId: serializer.fromJson<String?>(json['serverId']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      academyId: serializer.fromJson<String?>(json['academyId']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      userId: serializer.fromJson<String>(json['userId']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
      updatedBy: serializer.fromJson<String?>(json['updatedBy']),
      type: serializer.fromJson<String>(json['type']),
      category: serializer.fromJson<String>(json['category']),
      amount: serializer.fromJson<double>(json['amount']),
      description: serializer.fromJson<String>(json['description']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      clientUpdatedAt: serializer.fromJson<DateTime>(json['clientUpdatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncError: serializer.fromJson<String?>(json['lastSyncError']),
      version: serializer.fromJson<int?>(json['version']),
      rawJson: serializer.fromJson<String?>(json['rawJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<String>(localId),
      'serverId': serializer.toJson<String?>(serverId),
      'tenantId': serializer.toJson<String?>(tenantId),
      'academyId': serializer.toJson<String?>(academyId),
      'ownerId': serializer.toJson<String>(ownerId),
      'userId': serializer.toJson<String>(userId),
      'createdBy': serializer.toJson<String?>(createdBy),
      'updatedBy': serializer.toJson<String?>(updatedBy),
      'type': serializer.toJson<String>(type),
      'category': serializer.toJson<String>(category),
      'amount': serializer.toJson<double>(amount),
      'description': serializer.toJson<String>(description),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'clientUpdatedAt': serializer.toJson<DateTime>(clientUpdatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncError': serializer.toJson<String?>(lastSyncError),
      'version': serializer.toJson<int?>(version),
      'rawJson': serializer.toJson<String?>(rawJson),
    };
  }

  LocalFinanceTransaction copyWith({
    String? localId,
    Value<String?> serverId = const Value.absent(),
    Value<String?> tenantId = const Value.absent(),
    Value<String?> academyId = const Value.absent(),
    String? ownerId,
    String? userId,
    Value<String?> createdBy = const Value.absent(),
    Value<String?> updatedBy = const Value.absent(),
    String? type,
    String? category,
    double? amount,
    String? description,
    DateTime? occurredAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? clientUpdatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> lastSyncError = const Value.absent(),
    Value<int?> version = const Value.absent(),
    Value<String?> rawJson = const Value.absent(),
  }) => LocalFinanceTransaction(
    localId: localId ?? this.localId,
    serverId: serverId.present ? serverId.value : this.serverId,
    tenantId: tenantId.present ? tenantId.value : this.tenantId,
    academyId: academyId.present ? academyId.value : this.academyId,
    ownerId: ownerId ?? this.ownerId,
    userId: userId ?? this.userId,
    createdBy: createdBy.present ? createdBy.value : this.createdBy,
    updatedBy: updatedBy.present ? updatedBy.value : this.updatedBy,
    type: type ?? this.type,
    category: category ?? this.category,
    amount: amount ?? this.amount,
    description: description ?? this.description,
    occurredAt: occurredAt ?? this.occurredAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    clientUpdatedAt: clientUpdatedAt ?? this.clientUpdatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    lastSyncError: lastSyncError.present
        ? lastSyncError.value
        : this.lastSyncError,
    version: version.present ? version.value : this.version,
    rawJson: rawJson.present ? rawJson.value : this.rawJson,
  );
  LocalFinanceTransaction copyWithCompanion(
    LocalFinanceTransactionsCompanion data,
  ) {
    return LocalFinanceTransaction(
      localId: data.localId.present ? data.localId.value : this.localId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      tenantId: data.tenantId.present ? data.tenantId.value : this.tenantId,
      academyId: data.academyId.present ? data.academyId.value : this.academyId,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      updatedBy: data.updatedBy.present ? data.updatedBy.value : this.updatedBy,
      type: data.type.present ? data.type.value : this.type,
      category: data.category.present ? data.category.value : this.category,
      amount: data.amount.present ? data.amount.value : this.amount,
      description: data.description.present
          ? data.description.value
          : this.description,
      occurredAt: data.occurredAt.present
          ? data.occurredAt.value
          : this.occurredAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      clientUpdatedAt: data.clientUpdatedAt.present
          ? data.clientUpdatedAt.value
          : this.clientUpdatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      lastSyncError: data.lastSyncError.present
          ? data.lastSyncError.value
          : this.lastSyncError,
      version: data.version.present ? data.version.value : this.version,
      rawJson: data.rawJson.present ? data.rawJson.value : this.rawJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalFinanceTransaction(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('tenantId: $tenantId, ')
          ..write('academyId: $academyId, ')
          ..write('ownerId: $ownerId, ')
          ..write('userId: $userId, ')
          ..write('createdBy: $createdBy, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('type: $type, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('description: $description, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('clientUpdatedAt: $clientUpdatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncError: $lastSyncError, ')
          ..write('version: $version, ')
          ..write('rawJson: $rawJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    localId,
    serverId,
    tenantId,
    academyId,
    ownerId,
    userId,
    createdBy,
    updatedBy,
    type,
    category,
    amount,
    description,
    occurredAt,
    createdAt,
    updatedAt,
    clientUpdatedAt,
    deletedAt,
    syncStatus,
    lastSyncError,
    version,
    rawJson,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalFinanceTransaction &&
          other.localId == this.localId &&
          other.serverId == this.serverId &&
          other.tenantId == this.tenantId &&
          other.academyId == this.academyId &&
          other.ownerId == this.ownerId &&
          other.userId == this.userId &&
          other.createdBy == this.createdBy &&
          other.updatedBy == this.updatedBy &&
          other.type == this.type &&
          other.category == this.category &&
          other.amount == this.amount &&
          other.description == this.description &&
          other.occurredAt == this.occurredAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.clientUpdatedAt == this.clientUpdatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncError == this.lastSyncError &&
          other.version == this.version &&
          other.rawJson == this.rawJson);
}

class LocalFinanceTransactionsCompanion
    extends UpdateCompanion<LocalFinanceTransaction> {
  final Value<String> localId;
  final Value<String?> serverId;
  final Value<String?> tenantId;
  final Value<String?> academyId;
  final Value<String> ownerId;
  final Value<String> userId;
  final Value<String?> createdBy;
  final Value<String?> updatedBy;
  final Value<String> type;
  final Value<String> category;
  final Value<double> amount;
  final Value<String> description;
  final Value<DateTime> occurredAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime> clientUpdatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> lastSyncError;
  final Value<int?> version;
  final Value<String?> rawJson;
  final Value<int> rowid;
  const LocalFinanceTransactionsCompanion({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.academyId = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.type = const Value.absent(),
    this.category = const Value.absent(),
    this.amount = const Value.absent(),
    this.description = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.clientUpdatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncError = const Value.absent(),
    this.version = const Value.absent(),
    this.rawJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalFinanceTransactionsCompanion.insert({
    required String localId,
    this.serverId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.academyId = const Value.absent(),
    required String ownerId,
    required String userId,
    this.createdBy = const Value.absent(),
    this.updatedBy = const Value.absent(),
    required String type,
    required String category,
    required double amount,
    required String description,
    required DateTime occurredAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime clientUpdatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncError = const Value.absent(),
    this.version = const Value.absent(),
    this.rawJson = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : localId = Value(localId),
       ownerId = Value(ownerId),
       userId = Value(userId),
       type = Value(type),
       category = Value(category),
       amount = Value(amount),
       description = Value(description),
       occurredAt = Value(occurredAt),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       clientUpdatedAt = Value(clientUpdatedAt);
  static Insertable<LocalFinanceTransaction> custom({
    Expression<String>? localId,
    Expression<String>? serverId,
    Expression<String>? tenantId,
    Expression<String>? academyId,
    Expression<String>? ownerId,
    Expression<String>? userId,
    Expression<String>? createdBy,
    Expression<String>? updatedBy,
    Expression<String>? type,
    Expression<String>? category,
    Expression<double>? amount,
    Expression<String>? description,
    Expression<DateTime>? occurredAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? clientUpdatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? lastSyncError,
    Expression<int>? version,
    Expression<String>? rawJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (serverId != null) 'server_id': serverId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (academyId != null) 'academy_id': academyId,
      if (ownerId != null) 'owner_id': ownerId,
      if (userId != null) 'user_id': userId,
      if (createdBy != null) 'created_by': createdBy,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (type != null) 'type': type,
      if (category != null) 'category': category,
      if (amount != null) 'amount': amount,
      if (description != null) 'description': description,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (clientUpdatedAt != null) 'client_updated_at': clientUpdatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncError != null) 'last_sync_error': lastSyncError,
      if (version != null) 'version': version,
      if (rawJson != null) 'raw_json': rawJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalFinanceTransactionsCompanion copyWith({
    Value<String>? localId,
    Value<String?>? serverId,
    Value<String?>? tenantId,
    Value<String?>? academyId,
    Value<String>? ownerId,
    Value<String>? userId,
    Value<String?>? createdBy,
    Value<String?>? updatedBy,
    Value<String>? type,
    Value<String>? category,
    Value<double>? amount,
    Value<String>? description,
    Value<DateTime>? occurredAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime>? clientUpdatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? lastSyncError,
    Value<int?>? version,
    Value<String?>? rawJson,
    Value<int>? rowid,
  }) {
    return LocalFinanceTransactionsCompanion(
      localId: localId ?? this.localId,
      serverId: serverId ?? this.serverId,
      tenantId: tenantId ?? this.tenantId,
      academyId: academyId ?? this.academyId,
      ownerId: ownerId ?? this.ownerId,
      userId: userId ?? this.userId,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      type: type ?? this.type,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      occurredAt: occurredAt ?? this.occurredAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      clientUpdatedAt: clientUpdatedAt ?? this.clientUpdatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncError: lastSyncError ?? this.lastSyncError,
      version: version ?? this.version,
      rawJson: rawJson ?? this.rawJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<String>(localId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (academyId.present) {
      map['academy_id'] = Variable<String>(academyId.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (clientUpdatedAt.present) {
      map['client_updated_at'] = Variable<DateTime>(clientUpdatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncError.present) {
      map['last_sync_error'] = Variable<String>(lastSyncError.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (rawJson.present) {
      map['raw_json'] = Variable<String>(rawJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalFinanceTransactionsCompanion(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('tenantId: $tenantId, ')
          ..write('academyId: $academyId, ')
          ..write('ownerId: $ownerId, ')
          ..write('userId: $userId, ')
          ..write('createdBy: $createdBy, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('type: $type, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('description: $description, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('clientUpdatedAt: $clientUpdatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncError: $lastSyncError, ')
          ..write('version: $version, ')
          ..write('rawJson: $rawJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalMessagesTable extends LocalMessages
    with TableInfo<$LocalMessagesTable, LocalMessage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalMessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<String> localId = GeneratedColumn<String>(
    'local_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tenantIdMeta = const VerificationMeta(
    'tenantId',
  );
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
    'tenant_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _academyIdMeta = const VerificationMeta(
    'academyId',
  );
  @override
  late final GeneratedColumn<String> academyId = GeneratedColumn<String>(
    'academy_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdByMeta = const VerificationMeta(
    'createdBy',
  );
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
    'created_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByMeta = const VerificationMeta(
    'updatedBy',
  );
  @override
  late final GeneratedColumn<String> updatedBy = GeneratedColumn<String>(
    'updated_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _playerLocalIdMeta = const VerificationMeta(
    'playerLocalId',
  );
  @override
  late final GeneratedColumn<String> playerLocalId = GeneratedColumn<String>(
    'player_local_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _playerServerIdMeta = const VerificationMeta(
    'playerServerId',
  );
  @override
  late final GeneratedColumn<String> playerServerId = GeneratedColumn<String>(
    'player_server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recipientMeta = const VerificationMeta(
    'recipient',
  );
  @override
  late final GeneratedColumn<String> recipient = GeneratedColumn<String>(
    'recipient',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _channelMeta = const VerificationMeta(
    'channel',
  );
  @override
  late final GeneratedColumn<String> channel = GeneratedColumn<String>(
    'channel',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _scheduledAtMeta = const VerificationMeta(
    'scheduledAt',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledAt = GeneratedColumn<DateTime>(
    'scheduled_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sentAtMeta = const VerificationMeta('sentAt');
  @override
  late final GeneratedColumn<DateTime> sentAt = GeneratedColumn<DateTime>(
    'sent_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientUpdatedAtMeta = const VerificationMeta(
    'clientUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> clientUpdatedAt =
      GeneratedColumn<DateTime>(
        'client_updated_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('synced'),
  );
  static const VerificationMeta _lastSyncErrorMeta = const VerificationMeta(
    'lastSyncError',
  );
  @override
  late final GeneratedColumn<String> lastSyncError = GeneratedColumn<String>(
    'last_sync_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rawJsonMeta = const VerificationMeta(
    'rawJson',
  );
  @override
  late final GeneratedColumn<String> rawJson = GeneratedColumn<String>(
    'raw_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    serverId,
    tenantId,
    academyId,
    ownerId,
    userId,
    createdBy,
    updatedBy,
    playerLocalId,
    playerServerId,
    recipient,
    channel,
    body,
    status,
    scheduledAt,
    sentAt,
    createdAt,
    updatedAt,
    clientUpdatedAt,
    deletedAt,
    syncStatus,
    lastSyncError,
    version,
    rawJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_messages';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalMessage> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    } else if (isInserting) {
      context.missing(_localIdMeta);
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    }
    if (data.containsKey('tenant_id')) {
      context.handle(
        _tenantIdMeta,
        tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta),
      );
    }
    if (data.containsKey('academy_id')) {
      context.handle(
        _academyIdMeta,
        academyId.isAcceptableOrUnknown(data['academy_id']!, _academyIdMeta),
      );
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_by')) {
      context.handle(
        _createdByMeta,
        createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta),
      );
    }
    if (data.containsKey('updated_by')) {
      context.handle(
        _updatedByMeta,
        updatedBy.isAcceptableOrUnknown(data['updated_by']!, _updatedByMeta),
      );
    }
    if (data.containsKey('player_local_id')) {
      context.handle(
        _playerLocalIdMeta,
        playerLocalId.isAcceptableOrUnknown(
          data['player_local_id']!,
          _playerLocalIdMeta,
        ),
      );
    }
    if (data.containsKey('player_server_id')) {
      context.handle(
        _playerServerIdMeta,
        playerServerId.isAcceptableOrUnknown(
          data['player_server_id']!,
          _playerServerIdMeta,
        ),
      );
    }
    if (data.containsKey('recipient')) {
      context.handle(
        _recipientMeta,
        recipient.isAcceptableOrUnknown(data['recipient']!, _recipientMeta),
      );
    } else if (isInserting) {
      context.missing(_recipientMeta);
    }
    if (data.containsKey('channel')) {
      context.handle(
        _channelMeta,
        channel.isAcceptableOrUnknown(data['channel']!, _channelMeta),
      );
    } else if (isInserting) {
      context.missing(_channelMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('scheduled_at')) {
      context.handle(
        _scheduledAtMeta,
        scheduledAt.isAcceptableOrUnknown(
          data['scheduled_at']!,
          _scheduledAtMeta,
        ),
      );
    }
    if (data.containsKey('sent_at')) {
      context.handle(
        _sentAtMeta,
        sentAt.isAcceptableOrUnknown(data['sent_at']!, _sentAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('client_updated_at')) {
      context.handle(
        _clientUpdatedAtMeta,
        clientUpdatedAt.isAcceptableOrUnknown(
          data['client_updated_at']!,
          _clientUpdatedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_clientUpdatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('last_sync_error')) {
      context.handle(
        _lastSyncErrorMeta,
        lastSyncError.isAcceptableOrUnknown(
          data['last_sync_error']!,
          _lastSyncErrorMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('raw_json')) {
      context.handle(
        _rawJsonMeta,
        rawJson.isAcceptableOrUnknown(data['raw_json']!, _rawJsonMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  LocalMessage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalMessage(
      localId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_id'],
      )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      ),
      tenantId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_id'],
      ),
      academyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}academy_id'],
      ),
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by'],
      ),
      updatedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by'],
      ),
      playerLocalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}player_local_id'],
      ),
      playerServerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}player_server_id'],
      ),
      recipient: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipient'],
      )!,
      channel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}channel'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      scheduledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_at'],
      ),
      sentAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}sent_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      clientUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}client_updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      lastSyncError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_sync_error'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      ),
      rawJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_json'],
      ),
    );
  }

  @override
  $LocalMessagesTable createAlias(String alias) {
    return $LocalMessagesTable(attachedDatabase, alias);
  }
}

class LocalMessage extends DataClass implements Insertable<LocalMessage> {
  final String localId;
  final String? serverId;
  final String? tenantId;
  final String? academyId;
  final String ownerId;
  final String userId;
  final String? createdBy;
  final String? updatedBy;
  final String? playerLocalId;
  final String? playerServerId;
  final String recipient;
  final String channel;
  final String body;
  final String status;
  final DateTime? scheduledAt;
  final DateTime? sentAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime clientUpdatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? lastSyncError;
  final int? version;
  final String? rawJson;
  const LocalMessage({
    required this.localId,
    this.serverId,
    this.tenantId,
    this.academyId,
    required this.ownerId,
    required this.userId,
    this.createdBy,
    this.updatedBy,
    this.playerLocalId,
    this.playerServerId,
    required this.recipient,
    required this.channel,
    required this.body,
    required this.status,
    this.scheduledAt,
    this.sentAt,
    required this.createdAt,
    required this.updatedAt,
    required this.clientUpdatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.lastSyncError,
    this.version,
    this.rawJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<String>(localId);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<String>(serverId);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || academyId != null) {
      map['academy_id'] = Variable<String>(academyId);
    }
    map['owner_id'] = Variable<String>(ownerId);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || playerLocalId != null) {
      map['player_local_id'] = Variable<String>(playerLocalId);
    }
    if (!nullToAbsent || playerServerId != null) {
      map['player_server_id'] = Variable<String>(playerServerId);
    }
    map['recipient'] = Variable<String>(recipient);
    map['channel'] = Variable<String>(channel);
    map['body'] = Variable<String>(body);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || scheduledAt != null) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt);
    }
    if (!nullToAbsent || sentAt != null) {
      map['sent_at'] = Variable<DateTime>(sentAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['client_updated_at'] = Variable<DateTime>(clientUpdatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncError != null) {
      map['last_sync_error'] = Variable<String>(lastSyncError);
    }
    if (!nullToAbsent || version != null) {
      map['version'] = Variable<int>(version);
    }
    if (!nullToAbsent || rawJson != null) {
      map['raw_json'] = Variable<String>(rawJson);
    }
    return map;
  }

  LocalMessagesCompanion toCompanion(bool nullToAbsent) {
    return LocalMessagesCompanion(
      localId: Value(localId),
      serverId: serverId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverId),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      academyId: academyId == null && nullToAbsent
          ? const Value.absent()
          : Value(academyId),
      ownerId: Value(ownerId),
      userId: Value(userId),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      playerLocalId: playerLocalId == null && nullToAbsent
          ? const Value.absent()
          : Value(playerLocalId),
      playerServerId: playerServerId == null && nullToAbsent
          ? const Value.absent()
          : Value(playerServerId),
      recipient: Value(recipient),
      channel: Value(channel),
      body: Value(body),
      status: Value(status),
      scheduledAt: scheduledAt == null && nullToAbsent
          ? const Value.absent()
          : Value(scheduledAt),
      sentAt: sentAt == null && nullToAbsent
          ? const Value.absent()
          : Value(sentAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      clientUpdatedAt: Value(clientUpdatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      lastSyncError: lastSyncError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncError),
      version: version == null && nullToAbsent
          ? const Value.absent()
          : Value(version),
      rawJson: rawJson == null && nullToAbsent
          ? const Value.absent()
          : Value(rawJson),
    );
  }

  factory LocalMessage.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalMessage(
      localId: serializer.fromJson<String>(json['localId']),
      serverId: serializer.fromJson<String?>(json['serverId']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      academyId: serializer.fromJson<String?>(json['academyId']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      userId: serializer.fromJson<String>(json['userId']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
      updatedBy: serializer.fromJson<String?>(json['updatedBy']),
      playerLocalId: serializer.fromJson<String?>(json['playerLocalId']),
      playerServerId: serializer.fromJson<String?>(json['playerServerId']),
      recipient: serializer.fromJson<String>(json['recipient']),
      channel: serializer.fromJson<String>(json['channel']),
      body: serializer.fromJson<String>(json['body']),
      status: serializer.fromJson<String>(json['status']),
      scheduledAt: serializer.fromJson<DateTime?>(json['scheduledAt']),
      sentAt: serializer.fromJson<DateTime?>(json['sentAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      clientUpdatedAt: serializer.fromJson<DateTime>(json['clientUpdatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncError: serializer.fromJson<String?>(json['lastSyncError']),
      version: serializer.fromJson<int?>(json['version']),
      rawJson: serializer.fromJson<String?>(json['rawJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<String>(localId),
      'serverId': serializer.toJson<String?>(serverId),
      'tenantId': serializer.toJson<String?>(tenantId),
      'academyId': serializer.toJson<String?>(academyId),
      'ownerId': serializer.toJson<String>(ownerId),
      'userId': serializer.toJson<String>(userId),
      'createdBy': serializer.toJson<String?>(createdBy),
      'updatedBy': serializer.toJson<String?>(updatedBy),
      'playerLocalId': serializer.toJson<String?>(playerLocalId),
      'playerServerId': serializer.toJson<String?>(playerServerId),
      'recipient': serializer.toJson<String>(recipient),
      'channel': serializer.toJson<String>(channel),
      'body': serializer.toJson<String>(body),
      'status': serializer.toJson<String>(status),
      'scheduledAt': serializer.toJson<DateTime?>(scheduledAt),
      'sentAt': serializer.toJson<DateTime?>(sentAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'clientUpdatedAt': serializer.toJson<DateTime>(clientUpdatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncError': serializer.toJson<String?>(lastSyncError),
      'version': serializer.toJson<int?>(version),
      'rawJson': serializer.toJson<String?>(rawJson),
    };
  }

  LocalMessage copyWith({
    String? localId,
    Value<String?> serverId = const Value.absent(),
    Value<String?> tenantId = const Value.absent(),
    Value<String?> academyId = const Value.absent(),
    String? ownerId,
    String? userId,
    Value<String?> createdBy = const Value.absent(),
    Value<String?> updatedBy = const Value.absent(),
    Value<String?> playerLocalId = const Value.absent(),
    Value<String?> playerServerId = const Value.absent(),
    String? recipient,
    String? channel,
    String? body,
    String? status,
    Value<DateTime?> scheduledAt = const Value.absent(),
    Value<DateTime?> sentAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? clientUpdatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> lastSyncError = const Value.absent(),
    Value<int?> version = const Value.absent(),
    Value<String?> rawJson = const Value.absent(),
  }) => LocalMessage(
    localId: localId ?? this.localId,
    serverId: serverId.present ? serverId.value : this.serverId,
    tenantId: tenantId.present ? tenantId.value : this.tenantId,
    academyId: academyId.present ? academyId.value : this.academyId,
    ownerId: ownerId ?? this.ownerId,
    userId: userId ?? this.userId,
    createdBy: createdBy.present ? createdBy.value : this.createdBy,
    updatedBy: updatedBy.present ? updatedBy.value : this.updatedBy,
    playerLocalId: playerLocalId.present
        ? playerLocalId.value
        : this.playerLocalId,
    playerServerId: playerServerId.present
        ? playerServerId.value
        : this.playerServerId,
    recipient: recipient ?? this.recipient,
    channel: channel ?? this.channel,
    body: body ?? this.body,
    status: status ?? this.status,
    scheduledAt: scheduledAt.present ? scheduledAt.value : this.scheduledAt,
    sentAt: sentAt.present ? sentAt.value : this.sentAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    clientUpdatedAt: clientUpdatedAt ?? this.clientUpdatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    lastSyncError: lastSyncError.present
        ? lastSyncError.value
        : this.lastSyncError,
    version: version.present ? version.value : this.version,
    rawJson: rawJson.present ? rawJson.value : this.rawJson,
  );
  LocalMessage copyWithCompanion(LocalMessagesCompanion data) {
    return LocalMessage(
      localId: data.localId.present ? data.localId.value : this.localId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      tenantId: data.tenantId.present ? data.tenantId.value : this.tenantId,
      academyId: data.academyId.present ? data.academyId.value : this.academyId,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      updatedBy: data.updatedBy.present ? data.updatedBy.value : this.updatedBy,
      playerLocalId: data.playerLocalId.present
          ? data.playerLocalId.value
          : this.playerLocalId,
      playerServerId: data.playerServerId.present
          ? data.playerServerId.value
          : this.playerServerId,
      recipient: data.recipient.present ? data.recipient.value : this.recipient,
      channel: data.channel.present ? data.channel.value : this.channel,
      body: data.body.present ? data.body.value : this.body,
      status: data.status.present ? data.status.value : this.status,
      scheduledAt: data.scheduledAt.present
          ? data.scheduledAt.value
          : this.scheduledAt,
      sentAt: data.sentAt.present ? data.sentAt.value : this.sentAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      clientUpdatedAt: data.clientUpdatedAt.present
          ? data.clientUpdatedAt.value
          : this.clientUpdatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      lastSyncError: data.lastSyncError.present
          ? data.lastSyncError.value
          : this.lastSyncError,
      version: data.version.present ? data.version.value : this.version,
      rawJson: data.rawJson.present ? data.rawJson.value : this.rawJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalMessage(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('tenantId: $tenantId, ')
          ..write('academyId: $academyId, ')
          ..write('ownerId: $ownerId, ')
          ..write('userId: $userId, ')
          ..write('createdBy: $createdBy, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('playerLocalId: $playerLocalId, ')
          ..write('playerServerId: $playerServerId, ')
          ..write('recipient: $recipient, ')
          ..write('channel: $channel, ')
          ..write('body: $body, ')
          ..write('status: $status, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('sentAt: $sentAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('clientUpdatedAt: $clientUpdatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncError: $lastSyncError, ')
          ..write('version: $version, ')
          ..write('rawJson: $rawJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    localId,
    serverId,
    tenantId,
    academyId,
    ownerId,
    userId,
    createdBy,
    updatedBy,
    playerLocalId,
    playerServerId,
    recipient,
    channel,
    body,
    status,
    scheduledAt,
    sentAt,
    createdAt,
    updatedAt,
    clientUpdatedAt,
    deletedAt,
    syncStatus,
    lastSyncError,
    version,
    rawJson,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalMessage &&
          other.localId == this.localId &&
          other.serverId == this.serverId &&
          other.tenantId == this.tenantId &&
          other.academyId == this.academyId &&
          other.ownerId == this.ownerId &&
          other.userId == this.userId &&
          other.createdBy == this.createdBy &&
          other.updatedBy == this.updatedBy &&
          other.playerLocalId == this.playerLocalId &&
          other.playerServerId == this.playerServerId &&
          other.recipient == this.recipient &&
          other.channel == this.channel &&
          other.body == this.body &&
          other.status == this.status &&
          other.scheduledAt == this.scheduledAt &&
          other.sentAt == this.sentAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.clientUpdatedAt == this.clientUpdatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncError == this.lastSyncError &&
          other.version == this.version &&
          other.rawJson == this.rawJson);
}

class LocalMessagesCompanion extends UpdateCompanion<LocalMessage> {
  final Value<String> localId;
  final Value<String?> serverId;
  final Value<String?> tenantId;
  final Value<String?> academyId;
  final Value<String> ownerId;
  final Value<String> userId;
  final Value<String?> createdBy;
  final Value<String?> updatedBy;
  final Value<String?> playerLocalId;
  final Value<String?> playerServerId;
  final Value<String> recipient;
  final Value<String> channel;
  final Value<String> body;
  final Value<String> status;
  final Value<DateTime?> scheduledAt;
  final Value<DateTime?> sentAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime> clientUpdatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> lastSyncError;
  final Value<int?> version;
  final Value<String?> rawJson;
  final Value<int> rowid;
  const LocalMessagesCompanion({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.academyId = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.playerLocalId = const Value.absent(),
    this.playerServerId = const Value.absent(),
    this.recipient = const Value.absent(),
    this.channel = const Value.absent(),
    this.body = const Value.absent(),
    this.status = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.sentAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.clientUpdatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncError = const Value.absent(),
    this.version = const Value.absent(),
    this.rawJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalMessagesCompanion.insert({
    required String localId,
    this.serverId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.academyId = const Value.absent(),
    required String ownerId,
    required String userId,
    this.createdBy = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.playerLocalId = const Value.absent(),
    this.playerServerId = const Value.absent(),
    required String recipient,
    required String channel,
    required String body,
    this.status = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.sentAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime clientUpdatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncError = const Value.absent(),
    this.version = const Value.absent(),
    this.rawJson = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : localId = Value(localId),
       ownerId = Value(ownerId),
       userId = Value(userId),
       recipient = Value(recipient),
       channel = Value(channel),
       body = Value(body),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       clientUpdatedAt = Value(clientUpdatedAt);
  static Insertable<LocalMessage> custom({
    Expression<String>? localId,
    Expression<String>? serverId,
    Expression<String>? tenantId,
    Expression<String>? academyId,
    Expression<String>? ownerId,
    Expression<String>? userId,
    Expression<String>? createdBy,
    Expression<String>? updatedBy,
    Expression<String>? playerLocalId,
    Expression<String>? playerServerId,
    Expression<String>? recipient,
    Expression<String>? channel,
    Expression<String>? body,
    Expression<String>? status,
    Expression<DateTime>? scheduledAt,
    Expression<DateTime>? sentAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? clientUpdatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? lastSyncError,
    Expression<int>? version,
    Expression<String>? rawJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (serverId != null) 'server_id': serverId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (academyId != null) 'academy_id': academyId,
      if (ownerId != null) 'owner_id': ownerId,
      if (userId != null) 'user_id': userId,
      if (createdBy != null) 'created_by': createdBy,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (playerLocalId != null) 'player_local_id': playerLocalId,
      if (playerServerId != null) 'player_server_id': playerServerId,
      if (recipient != null) 'recipient': recipient,
      if (channel != null) 'channel': channel,
      if (body != null) 'body': body,
      if (status != null) 'status': status,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (sentAt != null) 'sent_at': sentAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (clientUpdatedAt != null) 'client_updated_at': clientUpdatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncError != null) 'last_sync_error': lastSyncError,
      if (version != null) 'version': version,
      if (rawJson != null) 'raw_json': rawJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalMessagesCompanion copyWith({
    Value<String>? localId,
    Value<String?>? serverId,
    Value<String?>? tenantId,
    Value<String?>? academyId,
    Value<String>? ownerId,
    Value<String>? userId,
    Value<String?>? createdBy,
    Value<String?>? updatedBy,
    Value<String?>? playerLocalId,
    Value<String?>? playerServerId,
    Value<String>? recipient,
    Value<String>? channel,
    Value<String>? body,
    Value<String>? status,
    Value<DateTime?>? scheduledAt,
    Value<DateTime?>? sentAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime>? clientUpdatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? lastSyncError,
    Value<int?>? version,
    Value<String?>? rawJson,
    Value<int>? rowid,
  }) {
    return LocalMessagesCompanion(
      localId: localId ?? this.localId,
      serverId: serverId ?? this.serverId,
      tenantId: tenantId ?? this.tenantId,
      academyId: academyId ?? this.academyId,
      ownerId: ownerId ?? this.ownerId,
      userId: userId ?? this.userId,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      playerLocalId: playerLocalId ?? this.playerLocalId,
      playerServerId: playerServerId ?? this.playerServerId,
      recipient: recipient ?? this.recipient,
      channel: channel ?? this.channel,
      body: body ?? this.body,
      status: status ?? this.status,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      sentAt: sentAt ?? this.sentAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      clientUpdatedAt: clientUpdatedAt ?? this.clientUpdatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncError: lastSyncError ?? this.lastSyncError,
      version: version ?? this.version,
      rawJson: rawJson ?? this.rawJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<String>(localId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (academyId.present) {
      map['academy_id'] = Variable<String>(academyId.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (playerLocalId.present) {
      map['player_local_id'] = Variable<String>(playerLocalId.value);
    }
    if (playerServerId.present) {
      map['player_server_id'] = Variable<String>(playerServerId.value);
    }
    if (recipient.present) {
      map['recipient'] = Variable<String>(recipient.value);
    }
    if (channel.present) {
      map['channel'] = Variable<String>(channel.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt.value);
    }
    if (sentAt.present) {
      map['sent_at'] = Variable<DateTime>(sentAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (clientUpdatedAt.present) {
      map['client_updated_at'] = Variable<DateTime>(clientUpdatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncError.present) {
      map['last_sync_error'] = Variable<String>(lastSyncError.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (rawJson.present) {
      map['raw_json'] = Variable<String>(rawJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalMessagesCompanion(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('tenantId: $tenantId, ')
          ..write('academyId: $academyId, ')
          ..write('ownerId: $ownerId, ')
          ..write('userId: $userId, ')
          ..write('createdBy: $createdBy, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('playerLocalId: $playerLocalId, ')
          ..write('playerServerId: $playerServerId, ')
          ..write('recipient: $recipient, ')
          ..write('channel: $channel, ')
          ..write('body: $body, ')
          ..write('status: $status, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('sentAt: $sentAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('clientUpdatedAt: $clientUpdatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncError: $lastSyncError, ')
          ..write('version: $version, ')
          ..write('rawJson: $rawJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalNotificationsTable extends LocalNotifications
    with TableInfo<$LocalNotificationsTable, LocalNotification> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalNotificationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<String> localId = GeneratedColumn<String>(
    'local_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tenantIdMeta = const VerificationMeta(
    'tenantId',
  );
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
    'tenant_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _academyIdMeta = const VerificationMeta(
    'academyId',
  );
  @override
  late final GeneratedColumn<String> academyId = GeneratedColumn<String>(
    'academy_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdByMeta = const VerificationMeta(
    'createdBy',
  );
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
    'created_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByMeta = const VerificationMeta(
    'updatedBy',
  );
  @override
  late final GeneratedColumn<String> updatedBy = GeneratedColumn<String>(
    'updated_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('info'),
  );
  static const VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool> isRead = GeneratedColumn<bool>(
    'is_read',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_read" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientUpdatedAtMeta = const VerificationMeta(
    'clientUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> clientUpdatedAt =
      GeneratedColumn<DateTime>(
        'client_updated_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('synced'),
  );
  static const VerificationMeta _lastSyncErrorMeta = const VerificationMeta(
    'lastSyncError',
  );
  @override
  late final GeneratedColumn<String> lastSyncError = GeneratedColumn<String>(
    'last_sync_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rawJsonMeta = const VerificationMeta(
    'rawJson',
  );
  @override
  late final GeneratedColumn<String> rawJson = GeneratedColumn<String>(
    'raw_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    localId,
    serverId,
    tenantId,
    academyId,
    ownerId,
    userId,
    createdBy,
    updatedBy,
    title,
    body,
    type,
    isRead,
    createdAt,
    updatedAt,
    clientUpdatedAt,
    deletedAt,
    syncStatus,
    lastSyncError,
    version,
    rawJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_notifications';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalNotification> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    } else if (isInserting) {
      context.missing(_localIdMeta);
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    }
    if (data.containsKey('tenant_id')) {
      context.handle(
        _tenantIdMeta,
        tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta),
      );
    }
    if (data.containsKey('academy_id')) {
      context.handle(
        _academyIdMeta,
        academyId.isAcceptableOrUnknown(data['academy_id']!, _academyIdMeta),
      );
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_by')) {
      context.handle(
        _createdByMeta,
        createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta),
      );
    }
    if (data.containsKey('updated_by')) {
      context.handle(
        _updatedByMeta,
        updatedBy.isAcceptableOrUnknown(data['updated_by']!, _updatedByMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('is_read')) {
      context.handle(
        _isReadMeta,
        isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('client_updated_at')) {
      context.handle(
        _clientUpdatedAtMeta,
        clientUpdatedAt.isAcceptableOrUnknown(
          data['client_updated_at']!,
          _clientUpdatedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_clientUpdatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('last_sync_error')) {
      context.handle(
        _lastSyncErrorMeta,
        lastSyncError.isAcceptableOrUnknown(
          data['last_sync_error']!,
          _lastSyncErrorMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('raw_json')) {
      context.handle(
        _rawJsonMeta,
        rawJson.isAcceptableOrUnknown(data['raw_json']!, _rawJsonMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  LocalNotification map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalNotification(
      localId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_id'],
      )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      ),
      tenantId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_id'],
      ),
      academyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}academy_id'],
      ),
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by'],
      ),
      updatedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      isRead: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_read'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      clientUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}client_updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      lastSyncError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_sync_error'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      ),
      rawJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_json'],
      ),
    );
  }

  @override
  $LocalNotificationsTable createAlias(String alias) {
    return $LocalNotificationsTable(attachedDatabase, alias);
  }
}

class LocalNotification extends DataClass
    implements Insertable<LocalNotification> {
  final String localId;
  final String? serverId;
  final String? tenantId;
  final String? academyId;
  final String ownerId;
  final String userId;
  final String? createdBy;
  final String? updatedBy;
  final String title;
  final String body;
  final String type;
  final bool isRead;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime clientUpdatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? lastSyncError;
  final int? version;
  final String? rawJson;
  const LocalNotification({
    required this.localId,
    this.serverId,
    this.tenantId,
    this.academyId,
    required this.ownerId,
    required this.userId,
    this.createdBy,
    this.updatedBy,
    required this.title,
    required this.body,
    required this.type,
    required this.isRead,
    required this.createdAt,
    required this.updatedAt,
    required this.clientUpdatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.lastSyncError,
    this.version,
    this.rawJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<String>(localId);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<String>(serverId);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || academyId != null) {
      map['academy_id'] = Variable<String>(academyId);
    }
    map['owner_id'] = Variable<String>(ownerId);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    map['type'] = Variable<String>(type);
    map['is_read'] = Variable<bool>(isRead);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['client_updated_at'] = Variable<DateTime>(clientUpdatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncError != null) {
      map['last_sync_error'] = Variable<String>(lastSyncError);
    }
    if (!nullToAbsent || version != null) {
      map['version'] = Variable<int>(version);
    }
    if (!nullToAbsent || rawJson != null) {
      map['raw_json'] = Variable<String>(rawJson);
    }
    return map;
  }

  LocalNotificationsCompanion toCompanion(bool nullToAbsent) {
    return LocalNotificationsCompanion(
      localId: Value(localId),
      serverId: serverId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverId),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      academyId: academyId == null && nullToAbsent
          ? const Value.absent()
          : Value(academyId),
      ownerId: Value(ownerId),
      userId: Value(userId),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      title: Value(title),
      body: Value(body),
      type: Value(type),
      isRead: Value(isRead),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      clientUpdatedAt: Value(clientUpdatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      lastSyncError: lastSyncError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncError),
      version: version == null && nullToAbsent
          ? const Value.absent()
          : Value(version),
      rawJson: rawJson == null && nullToAbsent
          ? const Value.absent()
          : Value(rawJson),
    );
  }

  factory LocalNotification.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalNotification(
      localId: serializer.fromJson<String>(json['localId']),
      serverId: serializer.fromJson<String?>(json['serverId']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      academyId: serializer.fromJson<String?>(json['academyId']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      userId: serializer.fromJson<String>(json['userId']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
      updatedBy: serializer.fromJson<String?>(json['updatedBy']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      type: serializer.fromJson<String>(json['type']),
      isRead: serializer.fromJson<bool>(json['isRead']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      clientUpdatedAt: serializer.fromJson<DateTime>(json['clientUpdatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncError: serializer.fromJson<String?>(json['lastSyncError']),
      version: serializer.fromJson<int?>(json['version']),
      rawJson: serializer.fromJson<String?>(json['rawJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<String>(localId),
      'serverId': serializer.toJson<String?>(serverId),
      'tenantId': serializer.toJson<String?>(tenantId),
      'academyId': serializer.toJson<String?>(academyId),
      'ownerId': serializer.toJson<String>(ownerId),
      'userId': serializer.toJson<String>(userId),
      'createdBy': serializer.toJson<String?>(createdBy),
      'updatedBy': serializer.toJson<String?>(updatedBy),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'type': serializer.toJson<String>(type),
      'isRead': serializer.toJson<bool>(isRead),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'clientUpdatedAt': serializer.toJson<DateTime>(clientUpdatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncError': serializer.toJson<String?>(lastSyncError),
      'version': serializer.toJson<int?>(version),
      'rawJson': serializer.toJson<String?>(rawJson),
    };
  }

  LocalNotification copyWith({
    String? localId,
    Value<String?> serverId = const Value.absent(),
    Value<String?> tenantId = const Value.absent(),
    Value<String?> academyId = const Value.absent(),
    String? ownerId,
    String? userId,
    Value<String?> createdBy = const Value.absent(),
    Value<String?> updatedBy = const Value.absent(),
    String? title,
    String? body,
    String? type,
    bool? isRead,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? clientUpdatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> lastSyncError = const Value.absent(),
    Value<int?> version = const Value.absent(),
    Value<String?> rawJson = const Value.absent(),
  }) => LocalNotification(
    localId: localId ?? this.localId,
    serverId: serverId.present ? serverId.value : this.serverId,
    tenantId: tenantId.present ? tenantId.value : this.tenantId,
    academyId: academyId.present ? academyId.value : this.academyId,
    ownerId: ownerId ?? this.ownerId,
    userId: userId ?? this.userId,
    createdBy: createdBy.present ? createdBy.value : this.createdBy,
    updatedBy: updatedBy.present ? updatedBy.value : this.updatedBy,
    title: title ?? this.title,
    body: body ?? this.body,
    type: type ?? this.type,
    isRead: isRead ?? this.isRead,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    clientUpdatedAt: clientUpdatedAt ?? this.clientUpdatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    lastSyncError: lastSyncError.present
        ? lastSyncError.value
        : this.lastSyncError,
    version: version.present ? version.value : this.version,
    rawJson: rawJson.present ? rawJson.value : this.rawJson,
  );
  LocalNotification copyWithCompanion(LocalNotificationsCompanion data) {
    return LocalNotification(
      localId: data.localId.present ? data.localId.value : this.localId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      tenantId: data.tenantId.present ? data.tenantId.value : this.tenantId,
      academyId: data.academyId.present ? data.academyId.value : this.academyId,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      updatedBy: data.updatedBy.present ? data.updatedBy.value : this.updatedBy,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      type: data.type.present ? data.type.value : this.type,
      isRead: data.isRead.present ? data.isRead.value : this.isRead,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      clientUpdatedAt: data.clientUpdatedAt.present
          ? data.clientUpdatedAt.value
          : this.clientUpdatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      lastSyncError: data.lastSyncError.present
          ? data.lastSyncError.value
          : this.lastSyncError,
      version: data.version.present ? data.version.value : this.version,
      rawJson: data.rawJson.present ? data.rawJson.value : this.rawJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalNotification(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('tenantId: $tenantId, ')
          ..write('academyId: $academyId, ')
          ..write('ownerId: $ownerId, ')
          ..write('userId: $userId, ')
          ..write('createdBy: $createdBy, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('type: $type, ')
          ..write('isRead: $isRead, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('clientUpdatedAt: $clientUpdatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncError: $lastSyncError, ')
          ..write('version: $version, ')
          ..write('rawJson: $rawJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localId,
    serverId,
    tenantId,
    academyId,
    ownerId,
    userId,
    createdBy,
    updatedBy,
    title,
    body,
    type,
    isRead,
    createdAt,
    updatedAt,
    clientUpdatedAt,
    deletedAt,
    syncStatus,
    lastSyncError,
    version,
    rawJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalNotification &&
          other.localId == this.localId &&
          other.serverId == this.serverId &&
          other.tenantId == this.tenantId &&
          other.academyId == this.academyId &&
          other.ownerId == this.ownerId &&
          other.userId == this.userId &&
          other.createdBy == this.createdBy &&
          other.updatedBy == this.updatedBy &&
          other.title == this.title &&
          other.body == this.body &&
          other.type == this.type &&
          other.isRead == this.isRead &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.clientUpdatedAt == this.clientUpdatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncError == this.lastSyncError &&
          other.version == this.version &&
          other.rawJson == this.rawJson);
}

class LocalNotificationsCompanion extends UpdateCompanion<LocalNotification> {
  final Value<String> localId;
  final Value<String?> serverId;
  final Value<String?> tenantId;
  final Value<String?> academyId;
  final Value<String> ownerId;
  final Value<String> userId;
  final Value<String?> createdBy;
  final Value<String?> updatedBy;
  final Value<String> title;
  final Value<String> body;
  final Value<String> type;
  final Value<bool> isRead;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime> clientUpdatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> lastSyncError;
  final Value<int?> version;
  final Value<String?> rawJson;
  final Value<int> rowid;
  const LocalNotificationsCompanion({
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.academyId = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.type = const Value.absent(),
    this.isRead = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.clientUpdatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncError = const Value.absent(),
    this.version = const Value.absent(),
    this.rawJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalNotificationsCompanion.insert({
    required String localId,
    this.serverId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.academyId = const Value.absent(),
    required String ownerId,
    required String userId,
    this.createdBy = const Value.absent(),
    this.updatedBy = const Value.absent(),
    required String title,
    required String body,
    this.type = const Value.absent(),
    this.isRead = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime clientUpdatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncError = const Value.absent(),
    this.version = const Value.absent(),
    this.rawJson = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : localId = Value(localId),
       ownerId = Value(ownerId),
       userId = Value(userId),
       title = Value(title),
       body = Value(body),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       clientUpdatedAt = Value(clientUpdatedAt);
  static Insertable<LocalNotification> custom({
    Expression<String>? localId,
    Expression<String>? serverId,
    Expression<String>? tenantId,
    Expression<String>? academyId,
    Expression<String>? ownerId,
    Expression<String>? userId,
    Expression<String>? createdBy,
    Expression<String>? updatedBy,
    Expression<String>? title,
    Expression<String>? body,
    Expression<String>? type,
    Expression<bool>? isRead,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? clientUpdatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? lastSyncError,
    Expression<int>? version,
    Expression<String>? rawJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (serverId != null) 'server_id': serverId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (academyId != null) 'academy_id': academyId,
      if (ownerId != null) 'owner_id': ownerId,
      if (userId != null) 'user_id': userId,
      if (createdBy != null) 'created_by': createdBy,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (type != null) 'type': type,
      if (isRead != null) 'is_read': isRead,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (clientUpdatedAt != null) 'client_updated_at': clientUpdatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncError != null) 'last_sync_error': lastSyncError,
      if (version != null) 'version': version,
      if (rawJson != null) 'raw_json': rawJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalNotificationsCompanion copyWith({
    Value<String>? localId,
    Value<String?>? serverId,
    Value<String?>? tenantId,
    Value<String?>? academyId,
    Value<String>? ownerId,
    Value<String>? userId,
    Value<String?>? createdBy,
    Value<String?>? updatedBy,
    Value<String>? title,
    Value<String>? body,
    Value<String>? type,
    Value<bool>? isRead,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime>? clientUpdatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? lastSyncError,
    Value<int?>? version,
    Value<String?>? rawJson,
    Value<int>? rowid,
  }) {
    return LocalNotificationsCompanion(
      localId: localId ?? this.localId,
      serverId: serverId ?? this.serverId,
      tenantId: tenantId ?? this.tenantId,
      academyId: academyId ?? this.academyId,
      ownerId: ownerId ?? this.ownerId,
      userId: userId ?? this.userId,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      title: title ?? this.title,
      body: body ?? this.body,
      type: type ?? this.type,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      clientUpdatedAt: clientUpdatedAt ?? this.clientUpdatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncError: lastSyncError ?? this.lastSyncError,
      version: version ?? this.version,
      rawJson: rawJson ?? this.rawJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<String>(localId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (academyId.present) {
      map['academy_id'] = Variable<String>(academyId.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (clientUpdatedAt.present) {
      map['client_updated_at'] = Variable<DateTime>(clientUpdatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncError.present) {
      map['last_sync_error'] = Variable<String>(lastSyncError.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (rawJson.present) {
      map['raw_json'] = Variable<String>(rawJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalNotificationsCompanion(')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('tenantId: $tenantId, ')
          ..write('academyId: $academyId, ')
          ..write('ownerId: $ownerId, ')
          ..write('userId: $userId, ')
          ..write('createdBy: $createdBy, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('type: $type, ')
          ..write('isRead: $isRead, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('clientUpdatedAt: $clientUpdatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncError: $lastSyncError, ')
          ..write('version: $version, ')
          ..write('rawJson: $rawJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncOutboxTable extends SyncOutbox
    with TableInfo<$SyncOutboxTable, SyncOutboxData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncOutboxTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _operationIdMeta = const VerificationMeta(
    'operationId',
  );
  @override
  late final GeneratedColumn<String> operationId = GeneratedColumn<String>(
    'operation_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tenantIdMeta = const VerificationMeta(
    'tenantId',
  );
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
    'tenant_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _academyIdMeta = const VerificationMeta(
    'academyId',
  );
  @override
  late final GeneratedColumn<String> academyId = GeneratedColumn<String>(
    'academy_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityLocalIdMeta = const VerificationMeta(
    'entityLocalId',
  );
  @override
  late final GeneratedColumn<String> entityLocalId = GeneratedColumn<String>(
    'entity_local_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityServerIdMeta = const VerificationMeta(
    'entityServerId',
  );
  @override
  late final GeneratedColumn<String> entityServerId = GeneratedColumn<String>(
    'entity_server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadJsonMeta = const VerificationMeta(
    'payloadJson',
  );
  @override
  late final GeneratedColumn<String> payloadJson = GeneratedColumn<String>(
    'payload_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idempotencyKeyMeta = const VerificationMeta(
    'idempotencyKey',
  );
  @override
  late final GeneratedColumn<String> idempotencyKey = GeneratedColumn<String>(
    'idempotency_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastErrorMeta = const VerificationMeta(
    'lastError',
  );
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    operationId,
    tenantId,
    academyId,
    ownerId,
    userId,
    entityType,
    entityLocalId,
    entityServerId,
    action,
    payloadJson,
    idempotencyKey,
    status,
    retryCount,
    lastError,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_outbox';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncOutboxData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('operation_id')) {
      context.handle(
        _operationIdMeta,
        operationId.isAcceptableOrUnknown(
          data['operation_id']!,
          _operationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_operationIdMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(
        _tenantIdMeta,
        tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta),
      );
    }
    if (data.containsKey('academy_id')) {
      context.handle(
        _academyIdMeta,
        academyId.isAcceptableOrUnknown(data['academy_id']!, _academyIdMeta),
      );
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_local_id')) {
      context.handle(
        _entityLocalIdMeta,
        entityLocalId.isAcceptableOrUnknown(
          data['entity_local_id']!,
          _entityLocalIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_entityLocalIdMeta);
    }
    if (data.containsKey('entity_server_id')) {
      context.handle(
        _entityServerIdMeta,
        entityServerId.isAcceptableOrUnknown(
          data['entity_server_id']!,
          _entityServerIdMeta,
        ),
      );
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('payload_json')) {
      context.handle(
        _payloadJsonMeta,
        payloadJson.isAcceptableOrUnknown(
          data['payload_json']!,
          _payloadJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_payloadJsonMeta);
    }
    if (data.containsKey('idempotency_key')) {
      context.handle(
        _idempotencyKeyMeta,
        idempotencyKey.isAcceptableOrUnknown(
          data['idempotency_key']!,
          _idempotencyKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idempotencyKeyMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
    }
    if (data.containsKey('last_error')) {
      context.handle(
        _lastErrorMeta,
        lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncOutboxData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncOutboxData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      operationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation_id'],
      )!,
      tenantId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_id'],
      ),
      academyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}academy_id'],
      ),
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityLocalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_local_id'],
      )!,
      entityServerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_server_id'],
      ),
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      payloadJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload_json'],
      )!,
      idempotencyKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}idempotency_key'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      )!,
      lastError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SyncOutboxTable createAlias(String alias) {
    return $SyncOutboxTable(attachedDatabase, alias);
  }
}

class SyncOutboxData extends DataClass implements Insertable<SyncOutboxData> {
  final String id;
  final String operationId;
  final String? tenantId;
  final String? academyId;
  final String ownerId;
  final String userId;
  final String entityType;
  final String entityLocalId;
  final String? entityServerId;
  final String action;
  final String payloadJson;
  final String idempotencyKey;
  final String status;
  final int retryCount;
  final String? lastError;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SyncOutboxData({
    required this.id,
    required this.operationId,
    this.tenantId,
    this.academyId,
    required this.ownerId,
    required this.userId,
    required this.entityType,
    required this.entityLocalId,
    this.entityServerId,
    required this.action,
    required this.payloadJson,
    required this.idempotencyKey,
    required this.status,
    required this.retryCount,
    this.lastError,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['operation_id'] = Variable<String>(operationId);
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || academyId != null) {
      map['academy_id'] = Variable<String>(academyId);
    }
    map['owner_id'] = Variable<String>(ownerId);
    map['user_id'] = Variable<String>(userId);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_local_id'] = Variable<String>(entityLocalId);
    if (!nullToAbsent || entityServerId != null) {
      map['entity_server_id'] = Variable<String>(entityServerId);
    }
    map['action'] = Variable<String>(action);
    map['payload_json'] = Variable<String>(payloadJson);
    map['idempotency_key'] = Variable<String>(idempotencyKey);
    map['status'] = Variable<String>(status);
    map['retry_count'] = Variable<int>(retryCount);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SyncOutboxCompanion toCompanion(bool nullToAbsent) {
    return SyncOutboxCompanion(
      id: Value(id),
      operationId: Value(operationId),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      academyId: academyId == null && nullToAbsent
          ? const Value.absent()
          : Value(academyId),
      ownerId: Value(ownerId),
      userId: Value(userId),
      entityType: Value(entityType),
      entityLocalId: Value(entityLocalId),
      entityServerId: entityServerId == null && nullToAbsent
          ? const Value.absent()
          : Value(entityServerId),
      action: Value(action),
      payloadJson: Value(payloadJson),
      idempotencyKey: Value(idempotencyKey),
      status: Value(status),
      retryCount: Value(retryCount),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SyncOutboxData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncOutboxData(
      id: serializer.fromJson<String>(json['id']),
      operationId: serializer.fromJson<String>(json['operationId']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      academyId: serializer.fromJson<String?>(json['academyId']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      userId: serializer.fromJson<String>(json['userId']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityLocalId: serializer.fromJson<String>(json['entityLocalId']),
      entityServerId: serializer.fromJson<String?>(json['entityServerId']),
      action: serializer.fromJson<String>(json['action']),
      payloadJson: serializer.fromJson<String>(json['payloadJson']),
      idempotencyKey: serializer.fromJson<String>(json['idempotencyKey']),
      status: serializer.fromJson<String>(json['status']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'operationId': serializer.toJson<String>(operationId),
      'tenantId': serializer.toJson<String?>(tenantId),
      'academyId': serializer.toJson<String?>(academyId),
      'ownerId': serializer.toJson<String>(ownerId),
      'userId': serializer.toJson<String>(userId),
      'entityType': serializer.toJson<String>(entityType),
      'entityLocalId': serializer.toJson<String>(entityLocalId),
      'entityServerId': serializer.toJson<String?>(entityServerId),
      'action': serializer.toJson<String>(action),
      'payloadJson': serializer.toJson<String>(payloadJson),
      'idempotencyKey': serializer.toJson<String>(idempotencyKey),
      'status': serializer.toJson<String>(status),
      'retryCount': serializer.toJson<int>(retryCount),
      'lastError': serializer.toJson<String?>(lastError),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SyncOutboxData copyWith({
    String? id,
    String? operationId,
    Value<String?> tenantId = const Value.absent(),
    Value<String?> academyId = const Value.absent(),
    String? ownerId,
    String? userId,
    String? entityType,
    String? entityLocalId,
    Value<String?> entityServerId = const Value.absent(),
    String? action,
    String? payloadJson,
    String? idempotencyKey,
    String? status,
    int? retryCount,
    Value<String?> lastError = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SyncOutboxData(
    id: id ?? this.id,
    operationId: operationId ?? this.operationId,
    tenantId: tenantId.present ? tenantId.value : this.tenantId,
    academyId: academyId.present ? academyId.value : this.academyId,
    ownerId: ownerId ?? this.ownerId,
    userId: userId ?? this.userId,
    entityType: entityType ?? this.entityType,
    entityLocalId: entityLocalId ?? this.entityLocalId,
    entityServerId: entityServerId.present
        ? entityServerId.value
        : this.entityServerId,
    action: action ?? this.action,
    payloadJson: payloadJson ?? this.payloadJson,
    idempotencyKey: idempotencyKey ?? this.idempotencyKey,
    status: status ?? this.status,
    retryCount: retryCount ?? this.retryCount,
    lastError: lastError.present ? lastError.value : this.lastError,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SyncOutboxData copyWithCompanion(SyncOutboxCompanion data) {
    return SyncOutboxData(
      id: data.id.present ? data.id.value : this.id,
      operationId: data.operationId.present
          ? data.operationId.value
          : this.operationId,
      tenantId: data.tenantId.present ? data.tenantId.value : this.tenantId,
      academyId: data.academyId.present ? data.academyId.value : this.academyId,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      userId: data.userId.present ? data.userId.value : this.userId,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityLocalId: data.entityLocalId.present
          ? data.entityLocalId.value
          : this.entityLocalId,
      entityServerId: data.entityServerId.present
          ? data.entityServerId.value
          : this.entityServerId,
      action: data.action.present ? data.action.value : this.action,
      payloadJson: data.payloadJson.present
          ? data.payloadJson.value
          : this.payloadJson,
      idempotencyKey: data.idempotencyKey.present
          ? data.idempotencyKey.value
          : this.idempotencyKey,
      status: data.status.present ? data.status.value : this.status,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncOutboxData(')
          ..write('id: $id, ')
          ..write('operationId: $operationId, ')
          ..write('tenantId: $tenantId, ')
          ..write('academyId: $academyId, ')
          ..write('ownerId: $ownerId, ')
          ..write('userId: $userId, ')
          ..write('entityType: $entityType, ')
          ..write('entityLocalId: $entityLocalId, ')
          ..write('entityServerId: $entityServerId, ')
          ..write('action: $action, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('idempotencyKey: $idempotencyKey, ')
          ..write('status: $status, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    operationId,
    tenantId,
    academyId,
    ownerId,
    userId,
    entityType,
    entityLocalId,
    entityServerId,
    action,
    payloadJson,
    idempotencyKey,
    status,
    retryCount,
    lastError,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncOutboxData &&
          other.id == this.id &&
          other.operationId == this.operationId &&
          other.tenantId == this.tenantId &&
          other.academyId == this.academyId &&
          other.ownerId == this.ownerId &&
          other.userId == this.userId &&
          other.entityType == this.entityType &&
          other.entityLocalId == this.entityLocalId &&
          other.entityServerId == this.entityServerId &&
          other.action == this.action &&
          other.payloadJson == this.payloadJson &&
          other.idempotencyKey == this.idempotencyKey &&
          other.status == this.status &&
          other.retryCount == this.retryCount &&
          other.lastError == this.lastError &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SyncOutboxCompanion extends UpdateCompanion<SyncOutboxData> {
  final Value<String> id;
  final Value<String> operationId;
  final Value<String?> tenantId;
  final Value<String?> academyId;
  final Value<String> ownerId;
  final Value<String> userId;
  final Value<String> entityType;
  final Value<String> entityLocalId;
  final Value<String?> entityServerId;
  final Value<String> action;
  final Value<String> payloadJson;
  final Value<String> idempotencyKey;
  final Value<String> status;
  final Value<int> retryCount;
  final Value<String?> lastError;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SyncOutboxCompanion({
    this.id = const Value.absent(),
    this.operationId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.academyId = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.userId = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityLocalId = const Value.absent(),
    this.entityServerId = const Value.absent(),
    this.action = const Value.absent(),
    this.payloadJson = const Value.absent(),
    this.idempotencyKey = const Value.absent(),
    this.status = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncOutboxCompanion.insert({
    required String id,
    required String operationId,
    this.tenantId = const Value.absent(),
    this.academyId = const Value.absent(),
    required String ownerId,
    required String userId,
    required String entityType,
    required String entityLocalId,
    this.entityServerId = const Value.absent(),
    required String action,
    required String payloadJson,
    required String idempotencyKey,
    this.status = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       operationId = Value(operationId),
       ownerId = Value(ownerId),
       userId = Value(userId),
       entityType = Value(entityType),
       entityLocalId = Value(entityLocalId),
       action = Value(action),
       payloadJson = Value(payloadJson),
       idempotencyKey = Value(idempotencyKey),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SyncOutboxData> custom({
    Expression<String>? id,
    Expression<String>? operationId,
    Expression<String>? tenantId,
    Expression<String>? academyId,
    Expression<String>? ownerId,
    Expression<String>? userId,
    Expression<String>? entityType,
    Expression<String>? entityLocalId,
    Expression<String>? entityServerId,
    Expression<String>? action,
    Expression<String>? payloadJson,
    Expression<String>? idempotencyKey,
    Expression<String>? status,
    Expression<int>? retryCount,
    Expression<String>? lastError,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (operationId != null) 'operation_id': operationId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (academyId != null) 'academy_id': academyId,
      if (ownerId != null) 'owner_id': ownerId,
      if (userId != null) 'user_id': userId,
      if (entityType != null) 'entity_type': entityType,
      if (entityLocalId != null) 'entity_local_id': entityLocalId,
      if (entityServerId != null) 'entity_server_id': entityServerId,
      if (action != null) 'action': action,
      if (payloadJson != null) 'payload_json': payloadJson,
      if (idempotencyKey != null) 'idempotency_key': idempotencyKey,
      if (status != null) 'status': status,
      if (retryCount != null) 'retry_count': retryCount,
      if (lastError != null) 'last_error': lastError,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncOutboxCompanion copyWith({
    Value<String>? id,
    Value<String>? operationId,
    Value<String?>? tenantId,
    Value<String?>? academyId,
    Value<String>? ownerId,
    Value<String>? userId,
    Value<String>? entityType,
    Value<String>? entityLocalId,
    Value<String?>? entityServerId,
    Value<String>? action,
    Value<String>? payloadJson,
    Value<String>? idempotencyKey,
    Value<String>? status,
    Value<int>? retryCount,
    Value<String?>? lastError,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SyncOutboxCompanion(
      id: id ?? this.id,
      operationId: operationId ?? this.operationId,
      tenantId: tenantId ?? this.tenantId,
      academyId: academyId ?? this.academyId,
      ownerId: ownerId ?? this.ownerId,
      userId: userId ?? this.userId,
      entityType: entityType ?? this.entityType,
      entityLocalId: entityLocalId ?? this.entityLocalId,
      entityServerId: entityServerId ?? this.entityServerId,
      action: action ?? this.action,
      payloadJson: payloadJson ?? this.payloadJson,
      idempotencyKey: idempotencyKey ?? this.idempotencyKey,
      status: status ?? this.status,
      retryCount: retryCount ?? this.retryCount,
      lastError: lastError ?? this.lastError,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (operationId.present) {
      map['operation_id'] = Variable<String>(operationId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (academyId.present) {
      map['academy_id'] = Variable<String>(academyId.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityLocalId.present) {
      map['entity_local_id'] = Variable<String>(entityLocalId.value);
    }
    if (entityServerId.present) {
      map['entity_server_id'] = Variable<String>(entityServerId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (payloadJson.present) {
      map['payload_json'] = Variable<String>(payloadJson.value);
    }
    if (idempotencyKey.present) {
      map['idempotency_key'] = Variable<String>(idempotencyKey.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncOutboxCompanion(')
          ..write('id: $id, ')
          ..write('operationId: $operationId, ')
          ..write('tenantId: $tenantId, ')
          ..write('academyId: $academyId, ')
          ..write('ownerId: $ownerId, ')
          ..write('userId: $userId, ')
          ..write('entityType: $entityType, ')
          ..write('entityLocalId: $entityLocalId, ')
          ..write('entityServerId: $entityServerId, ')
          ..write('action: $action, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('idempotencyKey: $idempotencyKey, ')
          ..write('status: $status, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SessionStateTable extends SessionState
    with TableInfo<$SessionStateTable, SessionStateData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionStateTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tenantIdMeta = const VerificationMeta(
    'tenantId',
  );
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
    'tenant_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _academyIdMeta = const VerificationMeta(
    'academyId',
  );
  @override
  late final GeneratedColumn<String> academyId = GeneratedColumn<String>(
    'academy_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastOnlineAtMeta = const VerificationMeta(
    'lastOnlineAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastOnlineAt = GeneratedColumn<DateTime>(
    'last_online_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localSessionExpiresAtMeta =
      const VerificationMeta('localSessionExpiresAt');
  @override
  late final GeneratedColumn<DateTime> localSessionExpiresAt =
      GeneratedColumn<DateTime>(
        'local_session_expires_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _isLastOnlineSessionMeta =
      const VerificationMeta('isLastOnlineSession');
  @override
  late final GeneratedColumn<bool> isLastOnlineSession = GeneratedColumn<bool>(
    'is_last_online_session',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_last_online_session" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    userId,
    tenantId,
    academyId,
    email,
    role,
    lastOnlineAt,
    localSessionExpiresAt,
    isLastOnlineSession,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'session_state';
  @override
  VerificationContext validateIntegrity(
    Insertable<SessionStateData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(
        _tenantIdMeta,
        tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta),
      );
    }
    if (data.containsKey('academy_id')) {
      context.handle(
        _academyIdMeta,
        academyId.isAcceptableOrUnknown(data['academy_id']!, _academyIdMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('last_online_at')) {
      context.handle(
        _lastOnlineAtMeta,
        lastOnlineAt.isAcceptableOrUnknown(
          data['last_online_at']!,
          _lastOnlineAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastOnlineAtMeta);
    }
    if (data.containsKey('local_session_expires_at')) {
      context.handle(
        _localSessionExpiresAtMeta,
        localSessionExpiresAt.isAcceptableOrUnknown(
          data['local_session_expires_at']!,
          _localSessionExpiresAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_localSessionExpiresAtMeta);
    }
    if (data.containsKey('is_last_online_session')) {
      context.handle(
        _isLastOnlineSessionMeta,
        isLastOnlineSession.isAcceptableOrUnknown(
          data['is_last_online_session']!,
          _isLastOnlineSessionMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  SessionStateData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionStateData(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      tenantId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_id'],
      ),
      academyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}academy_id'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      lastOnlineAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_online_at'],
      )!,
      localSessionExpiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}local_session_expires_at'],
      )!,
      isLastOnlineSession: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_last_online_session'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SessionStateTable createAlias(String alias) {
    return $SessionStateTable(attachedDatabase, alias);
  }
}

class SessionStateData extends DataClass
    implements Insertable<SessionStateData> {
  final String userId;
  final String? tenantId;
  final String? academyId;
  final String email;
  final String role;
  final DateTime lastOnlineAt;
  final DateTime localSessionExpiresAt;
  final bool isLastOnlineSession;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SessionStateData({
    required this.userId,
    this.tenantId,
    this.academyId,
    required this.email,
    required this.role,
    required this.lastOnlineAt,
    required this.localSessionExpiresAt,
    required this.isLastOnlineSession,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || academyId != null) {
      map['academy_id'] = Variable<String>(academyId);
    }
    map['email'] = Variable<String>(email);
    map['role'] = Variable<String>(role);
    map['last_online_at'] = Variable<DateTime>(lastOnlineAt);
    map['local_session_expires_at'] = Variable<DateTime>(localSessionExpiresAt);
    map['is_last_online_session'] = Variable<bool>(isLastOnlineSession);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SessionStateCompanion toCompanion(bool nullToAbsent) {
    return SessionStateCompanion(
      userId: Value(userId),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      academyId: academyId == null && nullToAbsent
          ? const Value.absent()
          : Value(academyId),
      email: Value(email),
      role: Value(role),
      lastOnlineAt: Value(lastOnlineAt),
      localSessionExpiresAt: Value(localSessionExpiresAt),
      isLastOnlineSession: Value(isLastOnlineSession),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SessionStateData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionStateData(
      userId: serializer.fromJson<String>(json['userId']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      academyId: serializer.fromJson<String?>(json['academyId']),
      email: serializer.fromJson<String>(json['email']),
      role: serializer.fromJson<String>(json['role']),
      lastOnlineAt: serializer.fromJson<DateTime>(json['lastOnlineAt']),
      localSessionExpiresAt: serializer.fromJson<DateTime>(
        json['localSessionExpiresAt'],
      ),
      isLastOnlineSession: serializer.fromJson<bool>(
        json['isLastOnlineSession'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'tenantId': serializer.toJson<String?>(tenantId),
      'academyId': serializer.toJson<String?>(academyId),
      'email': serializer.toJson<String>(email),
      'role': serializer.toJson<String>(role),
      'lastOnlineAt': serializer.toJson<DateTime>(lastOnlineAt),
      'localSessionExpiresAt': serializer.toJson<DateTime>(
        localSessionExpiresAt,
      ),
      'isLastOnlineSession': serializer.toJson<bool>(isLastOnlineSession),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SessionStateData copyWith({
    String? userId,
    Value<String?> tenantId = const Value.absent(),
    Value<String?> academyId = const Value.absent(),
    String? email,
    String? role,
    DateTime? lastOnlineAt,
    DateTime? localSessionExpiresAt,
    bool? isLastOnlineSession,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SessionStateData(
    userId: userId ?? this.userId,
    tenantId: tenantId.present ? tenantId.value : this.tenantId,
    academyId: academyId.present ? academyId.value : this.academyId,
    email: email ?? this.email,
    role: role ?? this.role,
    lastOnlineAt: lastOnlineAt ?? this.lastOnlineAt,
    localSessionExpiresAt: localSessionExpiresAt ?? this.localSessionExpiresAt,
    isLastOnlineSession: isLastOnlineSession ?? this.isLastOnlineSession,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SessionStateData copyWithCompanion(SessionStateCompanion data) {
    return SessionStateData(
      userId: data.userId.present ? data.userId.value : this.userId,
      tenantId: data.tenantId.present ? data.tenantId.value : this.tenantId,
      academyId: data.academyId.present ? data.academyId.value : this.academyId,
      email: data.email.present ? data.email.value : this.email,
      role: data.role.present ? data.role.value : this.role,
      lastOnlineAt: data.lastOnlineAt.present
          ? data.lastOnlineAt.value
          : this.lastOnlineAt,
      localSessionExpiresAt: data.localSessionExpiresAt.present
          ? data.localSessionExpiresAt.value
          : this.localSessionExpiresAt,
      isLastOnlineSession: data.isLastOnlineSession.present
          ? data.isLastOnlineSession.value
          : this.isLastOnlineSession,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionStateData(')
          ..write('userId: $userId, ')
          ..write('tenantId: $tenantId, ')
          ..write('academyId: $academyId, ')
          ..write('email: $email, ')
          ..write('role: $role, ')
          ..write('lastOnlineAt: $lastOnlineAt, ')
          ..write('localSessionExpiresAt: $localSessionExpiresAt, ')
          ..write('isLastOnlineSession: $isLastOnlineSession, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    userId,
    tenantId,
    academyId,
    email,
    role,
    lastOnlineAt,
    localSessionExpiresAt,
    isLastOnlineSession,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionStateData &&
          other.userId == this.userId &&
          other.tenantId == this.tenantId &&
          other.academyId == this.academyId &&
          other.email == this.email &&
          other.role == this.role &&
          other.lastOnlineAt == this.lastOnlineAt &&
          other.localSessionExpiresAt == this.localSessionExpiresAt &&
          other.isLastOnlineSession == this.isLastOnlineSession &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SessionStateCompanion extends UpdateCompanion<SessionStateData> {
  final Value<String> userId;
  final Value<String?> tenantId;
  final Value<String?> academyId;
  final Value<String> email;
  final Value<String> role;
  final Value<DateTime> lastOnlineAt;
  final Value<DateTime> localSessionExpiresAt;
  final Value<bool> isLastOnlineSession;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SessionStateCompanion({
    this.userId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.academyId = const Value.absent(),
    this.email = const Value.absent(),
    this.role = const Value.absent(),
    this.lastOnlineAt = const Value.absent(),
    this.localSessionExpiresAt = const Value.absent(),
    this.isLastOnlineSession = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SessionStateCompanion.insert({
    required String userId,
    this.tenantId = const Value.absent(),
    this.academyId = const Value.absent(),
    required String email,
    required String role,
    required DateTime lastOnlineAt,
    required DateTime localSessionExpiresAt,
    this.isLastOnlineSession = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : userId = Value(userId),
       email = Value(email),
       role = Value(role),
       lastOnlineAt = Value(lastOnlineAt),
       localSessionExpiresAt = Value(localSessionExpiresAt),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SessionStateData> custom({
    Expression<String>? userId,
    Expression<String>? tenantId,
    Expression<String>? academyId,
    Expression<String>? email,
    Expression<String>? role,
    Expression<DateTime>? lastOnlineAt,
    Expression<DateTime>? localSessionExpiresAt,
    Expression<bool>? isLastOnlineSession,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (academyId != null) 'academy_id': academyId,
      if (email != null) 'email': email,
      if (role != null) 'role': role,
      if (lastOnlineAt != null) 'last_online_at': lastOnlineAt,
      if (localSessionExpiresAt != null)
        'local_session_expires_at': localSessionExpiresAt,
      if (isLastOnlineSession != null)
        'is_last_online_session': isLastOnlineSession,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionStateCompanion copyWith({
    Value<String>? userId,
    Value<String?>? tenantId,
    Value<String?>? academyId,
    Value<String>? email,
    Value<String>? role,
    Value<DateTime>? lastOnlineAt,
    Value<DateTime>? localSessionExpiresAt,
    Value<bool>? isLastOnlineSession,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SessionStateCompanion(
      userId: userId ?? this.userId,
      tenantId: tenantId ?? this.tenantId,
      academyId: academyId ?? this.academyId,
      email: email ?? this.email,
      role: role ?? this.role,
      lastOnlineAt: lastOnlineAt ?? this.lastOnlineAt,
      localSessionExpiresAt:
          localSessionExpiresAt ?? this.localSessionExpiresAt,
      isLastOnlineSession: isLastOnlineSession ?? this.isLastOnlineSession,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (academyId.present) {
      map['academy_id'] = Variable<String>(academyId.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (lastOnlineAt.present) {
      map['last_online_at'] = Variable<DateTime>(lastOnlineAt.value);
    }
    if (localSessionExpiresAt.present) {
      map['local_session_expires_at'] = Variable<DateTime>(
        localSessionExpiresAt.value,
      );
    }
    if (isLastOnlineSession.present) {
      map['is_last_online_session'] = Variable<bool>(isLastOnlineSession.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionStateCompanion(')
          ..write('userId: $userId, ')
          ..write('tenantId: $tenantId, ')
          ..write('academyId: $academyId, ')
          ..write('email: $email, ')
          ..write('role: $role, ')
          ..write('lastOnlineAt: $lastOnlineAt, ')
          ..write('localSessionExpiresAt: $localSessionExpiresAt, ')
          ..write('isLastOnlineSession: $isLastOnlineSession, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncMetaTable extends SyncMeta
    with TableInfo<$SyncMetaTable, SyncMetaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncMetaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tenantIdMeta = const VerificationMeta(
    'tenantId',
  );
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
    'tenant_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _academyIdMeta = const VerificationMeta(
    'academyId',
  );
  @override
  late final GeneratedColumn<String> academyId = GeneratedColumn<String>(
    'academy_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastPulledAtMeta = const VerificationMeta(
    'lastPulledAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastPulledAt = GeneratedColumn<DateTime>(
    'last_pulled_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastPushedAtMeta = const VerificationMeta(
    'lastPushedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastPushedAt = GeneratedColumn<DateTime>(
    'last_pushed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverTimeMeta = const VerificationMeta(
    'serverTime',
  );
  @override
  late final GeneratedColumn<DateTime> serverTime = GeneratedColumn<DateTime>(
    'server_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSyncErrorMeta = const VerificationMeta(
    'lastSyncError',
  );
  @override
  late final GeneratedColumn<String> lastSyncError = GeneratedColumn<String>(
    'last_sync_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    ownerId,
    userId,
    tenantId,
    academyId,
    lastPulledAt,
    lastPushedAt,
    serverTime,
    lastSyncError,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_meta';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncMetaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(
        _tenantIdMeta,
        tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta),
      );
    }
    if (data.containsKey('academy_id')) {
      context.handle(
        _academyIdMeta,
        academyId.isAcceptableOrUnknown(data['academy_id']!, _academyIdMeta),
      );
    }
    if (data.containsKey('last_pulled_at')) {
      context.handle(
        _lastPulledAtMeta,
        lastPulledAt.isAcceptableOrUnknown(
          data['last_pulled_at']!,
          _lastPulledAtMeta,
        ),
      );
    }
    if (data.containsKey('last_pushed_at')) {
      context.handle(
        _lastPushedAtMeta,
        lastPushedAt.isAcceptableOrUnknown(
          data['last_pushed_at']!,
          _lastPushedAtMeta,
        ),
      );
    }
    if (data.containsKey('server_time')) {
      context.handle(
        _serverTimeMeta,
        serverTime.isAcceptableOrUnknown(data['server_time']!, _serverTimeMeta),
      );
    }
    if (data.containsKey('last_sync_error')) {
      context.handle(
        _lastSyncErrorMeta,
        lastSyncError.isAcceptableOrUnknown(
          data['last_sync_error']!,
          _lastSyncErrorMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ownerId};
  @override
  SyncMetaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncMetaData(
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      tenantId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_id'],
      ),
      academyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}academy_id'],
      ),
      lastPulledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_pulled_at'],
      ),
      lastPushedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_pushed_at'],
      ),
      serverTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_time'],
      ),
      lastSyncError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_sync_error'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SyncMetaTable createAlias(String alias) {
    return $SyncMetaTable(attachedDatabase, alias);
  }
}

class SyncMetaData extends DataClass implements Insertable<SyncMetaData> {
  final String ownerId;
  final String userId;
  final String? tenantId;
  final String? academyId;
  final DateTime? lastPulledAt;
  final DateTime? lastPushedAt;
  final DateTime? serverTime;
  final String? lastSyncError;
  final DateTime updatedAt;
  const SyncMetaData({
    required this.ownerId,
    required this.userId,
    this.tenantId,
    this.academyId,
    this.lastPulledAt,
    this.lastPushedAt,
    this.serverTime,
    this.lastSyncError,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['owner_id'] = Variable<String>(ownerId);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || academyId != null) {
      map['academy_id'] = Variable<String>(academyId);
    }
    if (!nullToAbsent || lastPulledAt != null) {
      map['last_pulled_at'] = Variable<DateTime>(lastPulledAt);
    }
    if (!nullToAbsent || lastPushedAt != null) {
      map['last_pushed_at'] = Variable<DateTime>(lastPushedAt);
    }
    if (!nullToAbsent || serverTime != null) {
      map['server_time'] = Variable<DateTime>(serverTime);
    }
    if (!nullToAbsent || lastSyncError != null) {
      map['last_sync_error'] = Variable<String>(lastSyncError);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SyncMetaCompanion toCompanion(bool nullToAbsent) {
    return SyncMetaCompanion(
      ownerId: Value(ownerId),
      userId: Value(userId),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      academyId: academyId == null && nullToAbsent
          ? const Value.absent()
          : Value(academyId),
      lastPulledAt: lastPulledAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPulledAt),
      lastPushedAt: lastPushedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPushedAt),
      serverTime: serverTime == null && nullToAbsent
          ? const Value.absent()
          : Value(serverTime),
      lastSyncError: lastSyncError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncError),
      updatedAt: Value(updatedAt),
    );
  }

  factory SyncMetaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncMetaData(
      ownerId: serializer.fromJson<String>(json['ownerId']),
      userId: serializer.fromJson<String>(json['userId']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      academyId: serializer.fromJson<String?>(json['academyId']),
      lastPulledAt: serializer.fromJson<DateTime?>(json['lastPulledAt']),
      lastPushedAt: serializer.fromJson<DateTime?>(json['lastPushedAt']),
      serverTime: serializer.fromJson<DateTime?>(json['serverTime']),
      lastSyncError: serializer.fromJson<String?>(json['lastSyncError']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ownerId': serializer.toJson<String>(ownerId),
      'userId': serializer.toJson<String>(userId),
      'tenantId': serializer.toJson<String?>(tenantId),
      'academyId': serializer.toJson<String?>(academyId),
      'lastPulledAt': serializer.toJson<DateTime?>(lastPulledAt),
      'lastPushedAt': serializer.toJson<DateTime?>(lastPushedAt),
      'serverTime': serializer.toJson<DateTime?>(serverTime),
      'lastSyncError': serializer.toJson<String?>(lastSyncError),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SyncMetaData copyWith({
    String? ownerId,
    String? userId,
    Value<String?> tenantId = const Value.absent(),
    Value<String?> academyId = const Value.absent(),
    Value<DateTime?> lastPulledAt = const Value.absent(),
    Value<DateTime?> lastPushedAt = const Value.absent(),
    Value<DateTime?> serverTime = const Value.absent(),
    Value<String?> lastSyncError = const Value.absent(),
    DateTime? updatedAt,
  }) => SyncMetaData(
    ownerId: ownerId ?? this.ownerId,
    userId: userId ?? this.userId,
    tenantId: tenantId.present ? tenantId.value : this.tenantId,
    academyId: academyId.present ? academyId.value : this.academyId,
    lastPulledAt: lastPulledAt.present ? lastPulledAt.value : this.lastPulledAt,
    lastPushedAt: lastPushedAt.present ? lastPushedAt.value : this.lastPushedAt,
    serverTime: serverTime.present ? serverTime.value : this.serverTime,
    lastSyncError: lastSyncError.present
        ? lastSyncError.value
        : this.lastSyncError,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SyncMetaData copyWithCompanion(SyncMetaCompanion data) {
    return SyncMetaData(
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      userId: data.userId.present ? data.userId.value : this.userId,
      tenantId: data.tenantId.present ? data.tenantId.value : this.tenantId,
      academyId: data.academyId.present ? data.academyId.value : this.academyId,
      lastPulledAt: data.lastPulledAt.present
          ? data.lastPulledAt.value
          : this.lastPulledAt,
      lastPushedAt: data.lastPushedAt.present
          ? data.lastPushedAt.value
          : this.lastPushedAt,
      serverTime: data.serverTime.present
          ? data.serverTime.value
          : this.serverTime,
      lastSyncError: data.lastSyncError.present
          ? data.lastSyncError.value
          : this.lastSyncError,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetaData(')
          ..write('ownerId: $ownerId, ')
          ..write('userId: $userId, ')
          ..write('tenantId: $tenantId, ')
          ..write('academyId: $academyId, ')
          ..write('lastPulledAt: $lastPulledAt, ')
          ..write('lastPushedAt: $lastPushedAt, ')
          ..write('serverTime: $serverTime, ')
          ..write('lastSyncError: $lastSyncError, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    ownerId,
    userId,
    tenantId,
    academyId,
    lastPulledAt,
    lastPushedAt,
    serverTime,
    lastSyncError,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncMetaData &&
          other.ownerId == this.ownerId &&
          other.userId == this.userId &&
          other.tenantId == this.tenantId &&
          other.academyId == this.academyId &&
          other.lastPulledAt == this.lastPulledAt &&
          other.lastPushedAt == this.lastPushedAt &&
          other.serverTime == this.serverTime &&
          other.lastSyncError == this.lastSyncError &&
          other.updatedAt == this.updatedAt);
}

class SyncMetaCompanion extends UpdateCompanion<SyncMetaData> {
  final Value<String> ownerId;
  final Value<String> userId;
  final Value<String?> tenantId;
  final Value<String?> academyId;
  final Value<DateTime?> lastPulledAt;
  final Value<DateTime?> lastPushedAt;
  final Value<DateTime?> serverTime;
  final Value<String?> lastSyncError;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SyncMetaCompanion({
    this.ownerId = const Value.absent(),
    this.userId = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.academyId = const Value.absent(),
    this.lastPulledAt = const Value.absent(),
    this.lastPushedAt = const Value.absent(),
    this.serverTime = const Value.absent(),
    this.lastSyncError = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncMetaCompanion.insert({
    required String ownerId,
    required String userId,
    this.tenantId = const Value.absent(),
    this.academyId = const Value.absent(),
    this.lastPulledAt = const Value.absent(),
    this.lastPushedAt = const Value.absent(),
    this.serverTime = const Value.absent(),
    this.lastSyncError = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : ownerId = Value(ownerId),
       userId = Value(userId),
       updatedAt = Value(updatedAt);
  static Insertable<SyncMetaData> custom({
    Expression<String>? ownerId,
    Expression<String>? userId,
    Expression<String>? tenantId,
    Expression<String>? academyId,
    Expression<DateTime>? lastPulledAt,
    Expression<DateTime>? lastPushedAt,
    Expression<DateTime>? serverTime,
    Expression<String>? lastSyncError,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (ownerId != null) 'owner_id': ownerId,
      if (userId != null) 'user_id': userId,
      if (tenantId != null) 'tenant_id': tenantId,
      if (academyId != null) 'academy_id': academyId,
      if (lastPulledAt != null) 'last_pulled_at': lastPulledAt,
      if (lastPushedAt != null) 'last_pushed_at': lastPushedAt,
      if (serverTime != null) 'server_time': serverTime,
      if (lastSyncError != null) 'last_sync_error': lastSyncError,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncMetaCompanion copyWith({
    Value<String>? ownerId,
    Value<String>? userId,
    Value<String?>? tenantId,
    Value<String?>? academyId,
    Value<DateTime?>? lastPulledAt,
    Value<DateTime?>? lastPushedAt,
    Value<DateTime?>? serverTime,
    Value<String?>? lastSyncError,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SyncMetaCompanion(
      ownerId: ownerId ?? this.ownerId,
      userId: userId ?? this.userId,
      tenantId: tenantId ?? this.tenantId,
      academyId: academyId ?? this.academyId,
      lastPulledAt: lastPulledAt ?? this.lastPulledAt,
      lastPushedAt: lastPushedAt ?? this.lastPushedAt,
      serverTime: serverTime ?? this.serverTime,
      lastSyncError: lastSyncError ?? this.lastSyncError,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (academyId.present) {
      map['academy_id'] = Variable<String>(academyId.value);
    }
    if (lastPulledAt.present) {
      map['last_pulled_at'] = Variable<DateTime>(lastPulledAt.value);
    }
    if (lastPushedAt.present) {
      map['last_pushed_at'] = Variable<DateTime>(lastPushedAt.value);
    }
    if (serverTime.present) {
      map['server_time'] = Variable<DateTime>(serverTime.value);
    }
    if (lastSyncError.present) {
      map['last_sync_error'] = Variable<String>(lastSyncError.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetaCompanion(')
          ..write('ownerId: $ownerId, ')
          ..write('userId: $userId, ')
          ..write('tenantId: $tenantId, ')
          ..write('academyId: $academyId, ')
          ..write('lastPulledAt: $lastPulledAt, ')
          ..write('lastPushedAt: $lastPushedAt, ')
          ..write('serverTime: $serverTime, ')
          ..write('lastSyncError: $lastSyncError, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EntityMappingsTable extends EntityMappings
    with TableInfo<$EntityMappingsTable, EntityMapping> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EntityMappingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tenantIdMeta = const VerificationMeta(
    'tenantId',
  );
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
    'tenant_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _academyIdMeta = const VerificationMeta(
    'academyId',
  );
  @override
  late final GeneratedColumn<String> academyId = GeneratedColumn<String>(
    'academy_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<String> localId = GeneratedColumn<String>(
    'local_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tenantId,
    academyId,
    ownerId,
    userId,
    entityType,
    localId,
    serverId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'entity_mappings';
  @override
  VerificationContext validateIntegrity(
    Insertable<EntityMapping> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(
        _tenantIdMeta,
        tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta),
      );
    }
    if (data.containsKey('academy_id')) {
      context.handle(
        _academyIdMeta,
        academyId.isAcceptableOrUnknown(data['academy_id']!, _academyIdMeta),
      );
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    } else if (isInserting) {
      context.missing(_localIdMeta);
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    } else if (isInserting) {
      context.missing(_serverIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EntityMapping map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EntityMapping(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      tenantId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_id'],
      ),
      academyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}academy_id'],
      ),
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      localId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_id'],
      )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $EntityMappingsTable createAlias(String alias) {
    return $EntityMappingsTable(attachedDatabase, alias);
  }
}

class EntityMapping extends DataClass implements Insertable<EntityMapping> {
  final String id;
  final String? tenantId;
  final String? academyId;
  final String ownerId;
  final String userId;
  final String entityType;
  final String localId;
  final String serverId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const EntityMapping({
    required this.id,
    this.tenantId,
    this.academyId,
    required this.ownerId,
    required this.userId,
    required this.entityType,
    required this.localId,
    required this.serverId,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || academyId != null) {
      map['academy_id'] = Variable<String>(academyId);
    }
    map['owner_id'] = Variable<String>(ownerId);
    map['user_id'] = Variable<String>(userId);
    map['entity_type'] = Variable<String>(entityType);
    map['local_id'] = Variable<String>(localId);
    map['server_id'] = Variable<String>(serverId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  EntityMappingsCompanion toCompanion(bool nullToAbsent) {
    return EntityMappingsCompanion(
      id: Value(id),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      academyId: academyId == null && nullToAbsent
          ? const Value.absent()
          : Value(academyId),
      ownerId: Value(ownerId),
      userId: Value(userId),
      entityType: Value(entityType),
      localId: Value(localId),
      serverId: Value(serverId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory EntityMapping.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EntityMapping(
      id: serializer.fromJson<String>(json['id']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      academyId: serializer.fromJson<String?>(json['academyId']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      userId: serializer.fromJson<String>(json['userId']),
      entityType: serializer.fromJson<String>(json['entityType']),
      localId: serializer.fromJson<String>(json['localId']),
      serverId: serializer.fromJson<String>(json['serverId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'tenantId': serializer.toJson<String?>(tenantId),
      'academyId': serializer.toJson<String?>(academyId),
      'ownerId': serializer.toJson<String>(ownerId),
      'userId': serializer.toJson<String>(userId),
      'entityType': serializer.toJson<String>(entityType),
      'localId': serializer.toJson<String>(localId),
      'serverId': serializer.toJson<String>(serverId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  EntityMapping copyWith({
    String? id,
    Value<String?> tenantId = const Value.absent(),
    Value<String?> academyId = const Value.absent(),
    String? ownerId,
    String? userId,
    String? entityType,
    String? localId,
    String? serverId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => EntityMapping(
    id: id ?? this.id,
    tenantId: tenantId.present ? tenantId.value : this.tenantId,
    academyId: academyId.present ? academyId.value : this.academyId,
    ownerId: ownerId ?? this.ownerId,
    userId: userId ?? this.userId,
    entityType: entityType ?? this.entityType,
    localId: localId ?? this.localId,
    serverId: serverId ?? this.serverId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  EntityMapping copyWithCompanion(EntityMappingsCompanion data) {
    return EntityMapping(
      id: data.id.present ? data.id.value : this.id,
      tenantId: data.tenantId.present ? data.tenantId.value : this.tenantId,
      academyId: data.academyId.present ? data.academyId.value : this.academyId,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      userId: data.userId.present ? data.userId.value : this.userId,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      localId: data.localId.present ? data.localId.value : this.localId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EntityMapping(')
          ..write('id: $id, ')
          ..write('tenantId: $tenantId, ')
          ..write('academyId: $academyId, ')
          ..write('ownerId: $ownerId, ')
          ..write('userId: $userId, ')
          ..write('entityType: $entityType, ')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    tenantId,
    academyId,
    ownerId,
    userId,
    entityType,
    localId,
    serverId,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EntityMapping &&
          other.id == this.id &&
          other.tenantId == this.tenantId &&
          other.academyId == this.academyId &&
          other.ownerId == this.ownerId &&
          other.userId == this.userId &&
          other.entityType == this.entityType &&
          other.localId == this.localId &&
          other.serverId == this.serverId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class EntityMappingsCompanion extends UpdateCompanion<EntityMapping> {
  final Value<String> id;
  final Value<String?> tenantId;
  final Value<String?> academyId;
  final Value<String> ownerId;
  final Value<String> userId;
  final Value<String> entityType;
  final Value<String> localId;
  final Value<String> serverId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const EntityMappingsCompanion({
    this.id = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.academyId = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.userId = const Value.absent(),
    this.entityType = const Value.absent(),
    this.localId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EntityMappingsCompanion.insert({
    required String id,
    this.tenantId = const Value.absent(),
    this.academyId = const Value.absent(),
    required String ownerId,
    required String userId,
    required String entityType,
    required String localId,
    required String serverId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       ownerId = Value(ownerId),
       userId = Value(userId),
       entityType = Value(entityType),
       localId = Value(localId),
       serverId = Value(serverId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<EntityMapping> custom({
    Expression<String>? id,
    Expression<String>? tenantId,
    Expression<String>? academyId,
    Expression<String>? ownerId,
    Expression<String>? userId,
    Expression<String>? entityType,
    Expression<String>? localId,
    Expression<String>? serverId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tenantId != null) 'tenant_id': tenantId,
      if (academyId != null) 'academy_id': academyId,
      if (ownerId != null) 'owner_id': ownerId,
      if (userId != null) 'user_id': userId,
      if (entityType != null) 'entity_type': entityType,
      if (localId != null) 'local_id': localId,
      if (serverId != null) 'server_id': serverId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EntityMappingsCompanion copyWith({
    Value<String>? id,
    Value<String?>? tenantId,
    Value<String?>? academyId,
    Value<String>? ownerId,
    Value<String>? userId,
    Value<String>? entityType,
    Value<String>? localId,
    Value<String>? serverId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return EntityMappingsCompanion(
      id: id ?? this.id,
      tenantId: tenantId ?? this.tenantId,
      academyId: academyId ?? this.academyId,
      ownerId: ownerId ?? this.ownerId,
      userId: userId ?? this.userId,
      entityType: entityType ?? this.entityType,
      localId: localId ?? this.localId,
      serverId: serverId ?? this.serverId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (academyId.present) {
      map['academy_id'] = Variable<String>(academyId.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (localId.present) {
      map['local_id'] = Variable<String>(localId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EntityMappingsCompanion(')
          ..write('id: $id, ')
          ..write('tenantId: $tenantId, ')
          ..write('academyId: $academyId, ')
          ..write('ownerId: $ownerId, ')
          ..write('userId: $userId, ')
          ..write('entityType: $entityType, ')
          ..write('localId: $localId, ')
          ..write('serverId: $serverId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AdminUsersCacheTable extends AdminUsersCache
    with TableInfo<$AdminUsersCacheTable, AdminUsersCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdminUsersCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _adminUserIdMeta = const VerificationMeta(
    'adminUserId',
  );
  @override
  late final GeneratedColumn<String> adminUserId = GeneratedColumn<String>(
    'admin_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadJsonMeta = const VerificationMeta(
    'payloadJson',
  );
  @override
  late final GeneratedColumn<String> payloadJson = GeneratedColumn<String>(
    'payload_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    adminUserId,
    email,
    payloadJson,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'admin_users_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<AdminUsersCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('admin_user_id')) {
      context.handle(
        _adminUserIdMeta,
        adminUserId.isAcceptableOrUnknown(
          data['admin_user_id']!,
          _adminUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_adminUserIdMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('payload_json')) {
      context.handle(
        _payloadJsonMeta,
        payloadJson.isAcceptableOrUnknown(
          data['payload_json']!,
          _payloadJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_payloadJsonMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AdminUsersCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AdminUsersCacheData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      adminUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}admin_user_id'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      payloadJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload_json'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $AdminUsersCacheTable createAlias(String alias) {
    return $AdminUsersCacheTable(attachedDatabase, alias);
  }
}

class AdminUsersCacheData extends DataClass
    implements Insertable<AdminUsersCacheData> {
  final String id;
  final String adminUserId;
  final String email;
  final String payloadJson;
  final DateTime cachedAt;
  const AdminUsersCacheData({
    required this.id,
    required this.adminUserId,
    required this.email,
    required this.payloadJson,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['admin_user_id'] = Variable<String>(adminUserId);
    map['email'] = Variable<String>(email);
    map['payload_json'] = Variable<String>(payloadJson);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  AdminUsersCacheCompanion toCompanion(bool nullToAbsent) {
    return AdminUsersCacheCompanion(
      id: Value(id),
      adminUserId: Value(adminUserId),
      email: Value(email),
      payloadJson: Value(payloadJson),
      cachedAt: Value(cachedAt),
    );
  }

  factory AdminUsersCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AdminUsersCacheData(
      id: serializer.fromJson<String>(json['id']),
      adminUserId: serializer.fromJson<String>(json['adminUserId']),
      email: serializer.fromJson<String>(json['email']),
      payloadJson: serializer.fromJson<String>(json['payloadJson']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'adminUserId': serializer.toJson<String>(adminUserId),
      'email': serializer.toJson<String>(email),
      'payloadJson': serializer.toJson<String>(payloadJson),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  AdminUsersCacheData copyWith({
    String? id,
    String? adminUserId,
    String? email,
    String? payloadJson,
    DateTime? cachedAt,
  }) => AdminUsersCacheData(
    id: id ?? this.id,
    adminUserId: adminUserId ?? this.adminUserId,
    email: email ?? this.email,
    payloadJson: payloadJson ?? this.payloadJson,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  AdminUsersCacheData copyWithCompanion(AdminUsersCacheCompanion data) {
    return AdminUsersCacheData(
      id: data.id.present ? data.id.value : this.id,
      adminUserId: data.adminUserId.present
          ? data.adminUserId.value
          : this.adminUserId,
      email: data.email.present ? data.email.value : this.email,
      payloadJson: data.payloadJson.present
          ? data.payloadJson.value
          : this.payloadJson,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AdminUsersCacheData(')
          ..write('id: $id, ')
          ..write('adminUserId: $adminUserId, ')
          ..write('email: $email, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, adminUserId, email, payloadJson, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdminUsersCacheData &&
          other.id == this.id &&
          other.adminUserId == this.adminUserId &&
          other.email == this.email &&
          other.payloadJson == this.payloadJson &&
          other.cachedAt == this.cachedAt);
}

class AdminUsersCacheCompanion extends UpdateCompanion<AdminUsersCacheData> {
  final Value<String> id;
  final Value<String> adminUserId;
  final Value<String> email;
  final Value<String> payloadJson;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const AdminUsersCacheCompanion({
    this.id = const Value.absent(),
    this.adminUserId = const Value.absent(),
    this.email = const Value.absent(),
    this.payloadJson = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AdminUsersCacheCompanion.insert({
    required String id,
    required String adminUserId,
    required String email,
    required String payloadJson,
    required DateTime cachedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       adminUserId = Value(adminUserId),
       email = Value(email),
       payloadJson = Value(payloadJson),
       cachedAt = Value(cachedAt);
  static Insertable<AdminUsersCacheData> custom({
    Expression<String>? id,
    Expression<String>? adminUserId,
    Expression<String>? email,
    Expression<String>? payloadJson,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (adminUserId != null) 'admin_user_id': adminUserId,
      if (email != null) 'email': email,
      if (payloadJson != null) 'payload_json': payloadJson,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AdminUsersCacheCompanion copyWith({
    Value<String>? id,
    Value<String>? adminUserId,
    Value<String>? email,
    Value<String>? payloadJson,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return AdminUsersCacheCompanion(
      id: id ?? this.id,
      adminUserId: adminUserId ?? this.adminUserId,
      email: email ?? this.email,
      payloadJson: payloadJson ?? this.payloadJson,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (adminUserId.present) {
      map['admin_user_id'] = Variable<String>(adminUserId.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (payloadJson.present) {
      map['payload_json'] = Variable<String>(payloadJson.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdminUsersCacheCompanion(')
          ..write('id: $id, ')
          ..write('adminUserId: $adminUserId, ')
          ..write('email: $email, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LocalPlayersTable localPlayers = $LocalPlayersTable(this);
  late final $LocalSubscriptionsTable localSubscriptions =
      $LocalSubscriptionsTable(this);
  late final $LocalEvaluationsTable localEvaluations = $LocalEvaluationsTable(
    this,
  );
  late final $LocalFinanceTransactionsTable localFinanceTransactions =
      $LocalFinanceTransactionsTable(this);
  late final $LocalMessagesTable localMessages = $LocalMessagesTable(this);
  late final $LocalNotificationsTable localNotifications =
      $LocalNotificationsTable(this);
  late final $SyncOutboxTable syncOutbox = $SyncOutboxTable(this);
  late final $SessionStateTable sessionState = $SessionStateTable(this);
  late final $SyncMetaTable syncMeta = $SyncMetaTable(this);
  late final $EntityMappingsTable entityMappings = $EntityMappingsTable(this);
  late final $AdminUsersCacheTable adminUsersCache = $AdminUsersCacheTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    localPlayers,
    localSubscriptions,
    localEvaluations,
    localFinanceTransactions,
    localMessages,
    localNotifications,
    syncOutbox,
    sessionState,
    syncMeta,
    entityMappings,
    adminUsersCache,
  ];
}

typedef $$LocalPlayersTableCreateCompanionBuilder =
    LocalPlayersCompanion Function({
      required String localId,
      Value<String?> serverId,
      Value<String?> tenantId,
      Value<String?> academyId,
      required String ownerId,
      required String userId,
      Value<String?> createdBy,
      Value<String?> updatedBy,
      required String name,
      required DateTime birthDate,
      required String phone,
      required String guardianName,
      required String guardianRelation,
      Value<String?> guardianJob,
      Value<bool> isActive,
      required DateTime createdAt,
      required DateTime updatedAt,
      required DateTime clientUpdatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> lastSyncError,
      Value<int?> version,
      Value<String?> rawJson,
      Value<int> rowid,
    });
typedef $$LocalPlayersTableUpdateCompanionBuilder =
    LocalPlayersCompanion Function({
      Value<String> localId,
      Value<String?> serverId,
      Value<String?> tenantId,
      Value<String?> academyId,
      Value<String> ownerId,
      Value<String> userId,
      Value<String?> createdBy,
      Value<String?> updatedBy,
      Value<String> name,
      Value<DateTime> birthDate,
      Value<String> phone,
      Value<String> guardianName,
      Value<String> guardianRelation,
      Value<String?> guardianJob,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime> clientUpdatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> lastSyncError,
      Value<int?> version,
      Value<String?> rawJson,
      Value<int> rowid,
    });

class $$LocalPlayersTableFilterComposer
    extends Composer<_$AppDatabase, $LocalPlayersTable> {
  $$LocalPlayersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantId => $composableBuilder(
    column: $table.tenantId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get academyId => $composableBuilder(
    column: $table.academyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedBy => $composableBuilder(
    column: $table.updatedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guardianName => $composableBuilder(
    column: $table.guardianName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guardianRelation => $composableBuilder(
    column: $table.guardianRelation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guardianJob => $composableBuilder(
    column: $table.guardianJob,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawJson => $composableBuilder(
    column: $table.rawJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalPlayersTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalPlayersTable> {
  $$LocalPlayersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantId => $composableBuilder(
    column: $table.tenantId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get academyId => $composableBuilder(
    column: $table.academyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedBy => $composableBuilder(
    column: $table.updatedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guardianName => $composableBuilder(
    column: $table.guardianName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guardianRelation => $composableBuilder(
    column: $table.guardianRelation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guardianJob => $composableBuilder(
    column: $table.guardianJob,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawJson => $composableBuilder(
    column: $table.rawJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalPlayersTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalPlayersTable> {
  $$LocalPlayersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get tenantId =>
      $composableBuilder(column: $table.tenantId, builder: (column) => column);

  GeneratedColumn<String> get academyId =>
      $composableBuilder(column: $table.academyId, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<String> get updatedBy =>
      $composableBuilder(column: $table.updatedBy, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get birthDate =>
      $composableBuilder(column: $table.birthDate, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get guardianName => $composableBuilder(
    column: $table.guardianName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get guardianRelation => $composableBuilder(
    column: $table.guardianRelation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get guardianJob => $composableBuilder(
    column: $table.guardianJob,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get rawJson =>
      $composableBuilder(column: $table.rawJson, builder: (column) => column);
}

class $$LocalPlayersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalPlayersTable,
          LocalPlayer,
          $$LocalPlayersTableFilterComposer,
          $$LocalPlayersTableOrderingComposer,
          $$LocalPlayersTableAnnotationComposer,
          $$LocalPlayersTableCreateCompanionBuilder,
          $$LocalPlayersTableUpdateCompanionBuilder,
          (
            LocalPlayer,
            BaseReferences<_$AppDatabase, $LocalPlayersTable, LocalPlayer>,
          ),
          LocalPlayer,
          PrefetchHooks Function()
        > {
  $$LocalPlayersTableTableManager(_$AppDatabase db, $LocalPlayersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalPlayersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalPlayersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalPlayersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                Value<String?> tenantId = const Value.absent(),
                Value<String?> academyId = const Value.absent(),
                Value<String> ownerId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String?> createdBy = const Value.absent(),
                Value<String?> updatedBy = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> birthDate = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> guardianName = const Value.absent(),
                Value<String> guardianRelation = const Value.absent(),
                Value<String?> guardianJob = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime> clientUpdatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastSyncError = const Value.absent(),
                Value<int?> version = const Value.absent(),
                Value<String?> rawJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalPlayersCompanion(
                localId: localId,
                serverId: serverId,
                tenantId: tenantId,
                academyId: academyId,
                ownerId: ownerId,
                userId: userId,
                createdBy: createdBy,
                updatedBy: updatedBy,
                name: name,
                birthDate: birthDate,
                phone: phone,
                guardianName: guardianName,
                guardianRelation: guardianRelation,
                guardianJob: guardianJob,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                clientUpdatedAt: clientUpdatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                lastSyncError: lastSyncError,
                version: version,
                rawJson: rawJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String localId,
                Value<String?> serverId = const Value.absent(),
                Value<String?> tenantId = const Value.absent(),
                Value<String?> academyId = const Value.absent(),
                required String ownerId,
                required String userId,
                Value<String?> createdBy = const Value.absent(),
                Value<String?> updatedBy = const Value.absent(),
                required String name,
                required DateTime birthDate,
                required String phone,
                required String guardianName,
                required String guardianRelation,
                Value<String?> guardianJob = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                required DateTime clientUpdatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastSyncError = const Value.absent(),
                Value<int?> version = const Value.absent(),
                Value<String?> rawJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalPlayersCompanion.insert(
                localId: localId,
                serverId: serverId,
                tenantId: tenantId,
                academyId: academyId,
                ownerId: ownerId,
                userId: userId,
                createdBy: createdBy,
                updatedBy: updatedBy,
                name: name,
                birthDate: birthDate,
                phone: phone,
                guardianName: guardianName,
                guardianRelation: guardianRelation,
                guardianJob: guardianJob,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                clientUpdatedAt: clientUpdatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                lastSyncError: lastSyncError,
                version: version,
                rawJson: rawJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalPlayersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalPlayersTable,
      LocalPlayer,
      $$LocalPlayersTableFilterComposer,
      $$LocalPlayersTableOrderingComposer,
      $$LocalPlayersTableAnnotationComposer,
      $$LocalPlayersTableCreateCompanionBuilder,
      $$LocalPlayersTableUpdateCompanionBuilder,
      (
        LocalPlayer,
        BaseReferences<_$AppDatabase, $LocalPlayersTable, LocalPlayer>,
      ),
      LocalPlayer,
      PrefetchHooks Function()
    >;
typedef $$LocalSubscriptionsTableCreateCompanionBuilder =
    LocalSubscriptionsCompanion Function({
      required String localId,
      Value<String?> serverId,
      Value<String?> tenantId,
      Value<String?> academyId,
      required String ownerId,
      required String userId,
      Value<String?> createdBy,
      Value<String?> updatedBy,
      Value<String?> playerLocalId,
      Value<String?> playerServerId,
      required double amount,
      required DateTime startDate,
      required DateTime endDate,
      Value<String?> notes,
      required DateTime createdAt,
      required DateTime updatedAt,
      required DateTime clientUpdatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> lastSyncError,
      Value<int?> version,
      Value<String?> rawJson,
      Value<int> rowid,
    });
typedef $$LocalSubscriptionsTableUpdateCompanionBuilder =
    LocalSubscriptionsCompanion Function({
      Value<String> localId,
      Value<String?> serverId,
      Value<String?> tenantId,
      Value<String?> academyId,
      Value<String> ownerId,
      Value<String> userId,
      Value<String?> createdBy,
      Value<String?> updatedBy,
      Value<String?> playerLocalId,
      Value<String?> playerServerId,
      Value<double> amount,
      Value<DateTime> startDate,
      Value<DateTime> endDate,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime> clientUpdatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> lastSyncError,
      Value<int?> version,
      Value<String?> rawJson,
      Value<int> rowid,
    });

class $$LocalSubscriptionsTableFilterComposer
    extends Composer<_$AppDatabase, $LocalSubscriptionsTable> {
  $$LocalSubscriptionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantId => $composableBuilder(
    column: $table.tenantId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get academyId => $composableBuilder(
    column: $table.academyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedBy => $composableBuilder(
    column: $table.updatedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get playerLocalId => $composableBuilder(
    column: $table.playerLocalId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get playerServerId => $composableBuilder(
    column: $table.playerServerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawJson => $composableBuilder(
    column: $table.rawJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalSubscriptionsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalSubscriptionsTable> {
  $$LocalSubscriptionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantId => $composableBuilder(
    column: $table.tenantId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get academyId => $composableBuilder(
    column: $table.academyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedBy => $composableBuilder(
    column: $table.updatedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get playerLocalId => $composableBuilder(
    column: $table.playerLocalId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get playerServerId => $composableBuilder(
    column: $table.playerServerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawJson => $composableBuilder(
    column: $table.rawJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalSubscriptionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalSubscriptionsTable> {
  $$LocalSubscriptionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get tenantId =>
      $composableBuilder(column: $table.tenantId, builder: (column) => column);

  GeneratedColumn<String> get academyId =>
      $composableBuilder(column: $table.academyId, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<String> get updatedBy =>
      $composableBuilder(column: $table.updatedBy, builder: (column) => column);

  GeneratedColumn<String> get playerLocalId => $composableBuilder(
    column: $table.playerLocalId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get playerServerId => $composableBuilder(
    column: $table.playerServerId,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get rawJson =>
      $composableBuilder(column: $table.rawJson, builder: (column) => column);
}

class $$LocalSubscriptionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalSubscriptionsTable,
          LocalSubscription,
          $$LocalSubscriptionsTableFilterComposer,
          $$LocalSubscriptionsTableOrderingComposer,
          $$LocalSubscriptionsTableAnnotationComposer,
          $$LocalSubscriptionsTableCreateCompanionBuilder,
          $$LocalSubscriptionsTableUpdateCompanionBuilder,
          (
            LocalSubscription,
            BaseReferences<
              _$AppDatabase,
              $LocalSubscriptionsTable,
              LocalSubscription
            >,
          ),
          LocalSubscription,
          PrefetchHooks Function()
        > {
  $$LocalSubscriptionsTableTableManager(
    _$AppDatabase db,
    $LocalSubscriptionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalSubscriptionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalSubscriptionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalSubscriptionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                Value<String?> tenantId = const Value.absent(),
                Value<String?> academyId = const Value.absent(),
                Value<String> ownerId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String?> createdBy = const Value.absent(),
                Value<String?> updatedBy = const Value.absent(),
                Value<String?> playerLocalId = const Value.absent(),
                Value<String?> playerServerId = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime> endDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime> clientUpdatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastSyncError = const Value.absent(),
                Value<int?> version = const Value.absent(),
                Value<String?> rawJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalSubscriptionsCompanion(
                localId: localId,
                serverId: serverId,
                tenantId: tenantId,
                academyId: academyId,
                ownerId: ownerId,
                userId: userId,
                createdBy: createdBy,
                updatedBy: updatedBy,
                playerLocalId: playerLocalId,
                playerServerId: playerServerId,
                amount: amount,
                startDate: startDate,
                endDate: endDate,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                clientUpdatedAt: clientUpdatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                lastSyncError: lastSyncError,
                version: version,
                rawJson: rawJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String localId,
                Value<String?> serverId = const Value.absent(),
                Value<String?> tenantId = const Value.absent(),
                Value<String?> academyId = const Value.absent(),
                required String ownerId,
                required String userId,
                Value<String?> createdBy = const Value.absent(),
                Value<String?> updatedBy = const Value.absent(),
                Value<String?> playerLocalId = const Value.absent(),
                Value<String?> playerServerId = const Value.absent(),
                required double amount,
                required DateTime startDate,
                required DateTime endDate,
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                required DateTime clientUpdatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastSyncError = const Value.absent(),
                Value<int?> version = const Value.absent(),
                Value<String?> rawJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalSubscriptionsCompanion.insert(
                localId: localId,
                serverId: serverId,
                tenantId: tenantId,
                academyId: academyId,
                ownerId: ownerId,
                userId: userId,
                createdBy: createdBy,
                updatedBy: updatedBy,
                playerLocalId: playerLocalId,
                playerServerId: playerServerId,
                amount: amount,
                startDate: startDate,
                endDate: endDate,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                clientUpdatedAt: clientUpdatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                lastSyncError: lastSyncError,
                version: version,
                rawJson: rawJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalSubscriptionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalSubscriptionsTable,
      LocalSubscription,
      $$LocalSubscriptionsTableFilterComposer,
      $$LocalSubscriptionsTableOrderingComposer,
      $$LocalSubscriptionsTableAnnotationComposer,
      $$LocalSubscriptionsTableCreateCompanionBuilder,
      $$LocalSubscriptionsTableUpdateCompanionBuilder,
      (
        LocalSubscription,
        BaseReferences<
          _$AppDatabase,
          $LocalSubscriptionsTable,
          LocalSubscription
        >,
      ),
      LocalSubscription,
      PrefetchHooks Function()
    >;
typedef $$LocalEvaluationsTableCreateCompanionBuilder =
    LocalEvaluationsCompanion Function({
      required String localId,
      Value<String?> serverId,
      Value<String?> tenantId,
      Value<String?> academyId,
      required String ownerId,
      required String userId,
      Value<String?> createdBy,
      Value<String?> updatedBy,
      Value<String?> playerLocalId,
      Value<String?> playerServerId,
      required String coach,
      required DateTime evaluationDate,
      required int fitness,
      required int speed,
      required int skill,
      required int discipline,
      required int teamwork,
      Value<String> notes,
      required DateTime createdAt,
      required DateTime updatedAt,
      required DateTime clientUpdatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> lastSyncError,
      Value<int?> version,
      Value<String?> rawJson,
      Value<int> rowid,
    });
typedef $$LocalEvaluationsTableUpdateCompanionBuilder =
    LocalEvaluationsCompanion Function({
      Value<String> localId,
      Value<String?> serverId,
      Value<String?> tenantId,
      Value<String?> academyId,
      Value<String> ownerId,
      Value<String> userId,
      Value<String?> createdBy,
      Value<String?> updatedBy,
      Value<String?> playerLocalId,
      Value<String?> playerServerId,
      Value<String> coach,
      Value<DateTime> evaluationDate,
      Value<int> fitness,
      Value<int> speed,
      Value<int> skill,
      Value<int> discipline,
      Value<int> teamwork,
      Value<String> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime> clientUpdatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> lastSyncError,
      Value<int?> version,
      Value<String?> rawJson,
      Value<int> rowid,
    });

class $$LocalEvaluationsTableFilterComposer
    extends Composer<_$AppDatabase, $LocalEvaluationsTable> {
  $$LocalEvaluationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantId => $composableBuilder(
    column: $table.tenantId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get academyId => $composableBuilder(
    column: $table.academyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedBy => $composableBuilder(
    column: $table.updatedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get playerLocalId => $composableBuilder(
    column: $table.playerLocalId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get playerServerId => $composableBuilder(
    column: $table.playerServerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coach => $composableBuilder(
    column: $table.coach,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get evaluationDate => $composableBuilder(
    column: $table.evaluationDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fitness => $composableBuilder(
    column: $table.fitness,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get speed => $composableBuilder(
    column: $table.speed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get skill => $composableBuilder(
    column: $table.skill,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get discipline => $composableBuilder(
    column: $table.discipline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get teamwork => $composableBuilder(
    column: $table.teamwork,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawJson => $composableBuilder(
    column: $table.rawJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalEvaluationsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalEvaluationsTable> {
  $$LocalEvaluationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantId => $composableBuilder(
    column: $table.tenantId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get academyId => $composableBuilder(
    column: $table.academyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedBy => $composableBuilder(
    column: $table.updatedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get playerLocalId => $composableBuilder(
    column: $table.playerLocalId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get playerServerId => $composableBuilder(
    column: $table.playerServerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coach => $composableBuilder(
    column: $table.coach,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get evaluationDate => $composableBuilder(
    column: $table.evaluationDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fitness => $composableBuilder(
    column: $table.fitness,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get speed => $composableBuilder(
    column: $table.speed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get skill => $composableBuilder(
    column: $table.skill,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discipline => $composableBuilder(
    column: $table.discipline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get teamwork => $composableBuilder(
    column: $table.teamwork,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawJson => $composableBuilder(
    column: $table.rawJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalEvaluationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalEvaluationsTable> {
  $$LocalEvaluationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get tenantId =>
      $composableBuilder(column: $table.tenantId, builder: (column) => column);

  GeneratedColumn<String> get academyId =>
      $composableBuilder(column: $table.academyId, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<String> get updatedBy =>
      $composableBuilder(column: $table.updatedBy, builder: (column) => column);

  GeneratedColumn<String> get playerLocalId => $composableBuilder(
    column: $table.playerLocalId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get playerServerId => $composableBuilder(
    column: $table.playerServerId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get coach =>
      $composableBuilder(column: $table.coach, builder: (column) => column);

  GeneratedColumn<DateTime> get evaluationDate => $composableBuilder(
    column: $table.evaluationDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fitness =>
      $composableBuilder(column: $table.fitness, builder: (column) => column);

  GeneratedColumn<int> get speed =>
      $composableBuilder(column: $table.speed, builder: (column) => column);

  GeneratedColumn<int> get skill =>
      $composableBuilder(column: $table.skill, builder: (column) => column);

  GeneratedColumn<int> get discipline => $composableBuilder(
    column: $table.discipline,
    builder: (column) => column,
  );

  GeneratedColumn<int> get teamwork =>
      $composableBuilder(column: $table.teamwork, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get rawJson =>
      $composableBuilder(column: $table.rawJson, builder: (column) => column);
}

class $$LocalEvaluationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalEvaluationsTable,
          LocalEvaluation,
          $$LocalEvaluationsTableFilterComposer,
          $$LocalEvaluationsTableOrderingComposer,
          $$LocalEvaluationsTableAnnotationComposer,
          $$LocalEvaluationsTableCreateCompanionBuilder,
          $$LocalEvaluationsTableUpdateCompanionBuilder,
          (
            LocalEvaluation,
            BaseReferences<
              _$AppDatabase,
              $LocalEvaluationsTable,
              LocalEvaluation
            >,
          ),
          LocalEvaluation,
          PrefetchHooks Function()
        > {
  $$LocalEvaluationsTableTableManager(
    _$AppDatabase db,
    $LocalEvaluationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalEvaluationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalEvaluationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalEvaluationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                Value<String?> tenantId = const Value.absent(),
                Value<String?> academyId = const Value.absent(),
                Value<String> ownerId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String?> createdBy = const Value.absent(),
                Value<String?> updatedBy = const Value.absent(),
                Value<String?> playerLocalId = const Value.absent(),
                Value<String?> playerServerId = const Value.absent(),
                Value<String> coach = const Value.absent(),
                Value<DateTime> evaluationDate = const Value.absent(),
                Value<int> fitness = const Value.absent(),
                Value<int> speed = const Value.absent(),
                Value<int> skill = const Value.absent(),
                Value<int> discipline = const Value.absent(),
                Value<int> teamwork = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime> clientUpdatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastSyncError = const Value.absent(),
                Value<int?> version = const Value.absent(),
                Value<String?> rawJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalEvaluationsCompanion(
                localId: localId,
                serverId: serverId,
                tenantId: tenantId,
                academyId: academyId,
                ownerId: ownerId,
                userId: userId,
                createdBy: createdBy,
                updatedBy: updatedBy,
                playerLocalId: playerLocalId,
                playerServerId: playerServerId,
                coach: coach,
                evaluationDate: evaluationDate,
                fitness: fitness,
                speed: speed,
                skill: skill,
                discipline: discipline,
                teamwork: teamwork,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                clientUpdatedAt: clientUpdatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                lastSyncError: lastSyncError,
                version: version,
                rawJson: rawJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String localId,
                Value<String?> serverId = const Value.absent(),
                Value<String?> tenantId = const Value.absent(),
                Value<String?> academyId = const Value.absent(),
                required String ownerId,
                required String userId,
                Value<String?> createdBy = const Value.absent(),
                Value<String?> updatedBy = const Value.absent(),
                Value<String?> playerLocalId = const Value.absent(),
                Value<String?> playerServerId = const Value.absent(),
                required String coach,
                required DateTime evaluationDate,
                required int fitness,
                required int speed,
                required int skill,
                required int discipline,
                required int teamwork,
                Value<String> notes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                required DateTime clientUpdatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastSyncError = const Value.absent(),
                Value<int?> version = const Value.absent(),
                Value<String?> rawJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalEvaluationsCompanion.insert(
                localId: localId,
                serverId: serverId,
                tenantId: tenantId,
                academyId: academyId,
                ownerId: ownerId,
                userId: userId,
                createdBy: createdBy,
                updatedBy: updatedBy,
                playerLocalId: playerLocalId,
                playerServerId: playerServerId,
                coach: coach,
                evaluationDate: evaluationDate,
                fitness: fitness,
                speed: speed,
                skill: skill,
                discipline: discipline,
                teamwork: teamwork,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                clientUpdatedAt: clientUpdatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                lastSyncError: lastSyncError,
                version: version,
                rawJson: rawJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalEvaluationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalEvaluationsTable,
      LocalEvaluation,
      $$LocalEvaluationsTableFilterComposer,
      $$LocalEvaluationsTableOrderingComposer,
      $$LocalEvaluationsTableAnnotationComposer,
      $$LocalEvaluationsTableCreateCompanionBuilder,
      $$LocalEvaluationsTableUpdateCompanionBuilder,
      (
        LocalEvaluation,
        BaseReferences<_$AppDatabase, $LocalEvaluationsTable, LocalEvaluation>,
      ),
      LocalEvaluation,
      PrefetchHooks Function()
    >;
typedef $$LocalFinanceTransactionsTableCreateCompanionBuilder =
    LocalFinanceTransactionsCompanion Function({
      required String localId,
      Value<String?> serverId,
      Value<String?> tenantId,
      Value<String?> academyId,
      required String ownerId,
      required String userId,
      Value<String?> createdBy,
      Value<String?> updatedBy,
      required String type,
      required String category,
      required double amount,
      required String description,
      required DateTime occurredAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      required DateTime clientUpdatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> lastSyncError,
      Value<int?> version,
      Value<String?> rawJson,
      Value<int> rowid,
    });
typedef $$LocalFinanceTransactionsTableUpdateCompanionBuilder =
    LocalFinanceTransactionsCompanion Function({
      Value<String> localId,
      Value<String?> serverId,
      Value<String?> tenantId,
      Value<String?> academyId,
      Value<String> ownerId,
      Value<String> userId,
      Value<String?> createdBy,
      Value<String?> updatedBy,
      Value<String> type,
      Value<String> category,
      Value<double> amount,
      Value<String> description,
      Value<DateTime> occurredAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime> clientUpdatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> lastSyncError,
      Value<int?> version,
      Value<String?> rawJson,
      Value<int> rowid,
    });

class $$LocalFinanceTransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $LocalFinanceTransactionsTable> {
  $$LocalFinanceTransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantId => $composableBuilder(
    column: $table.tenantId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get academyId => $composableBuilder(
    column: $table.academyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedBy => $composableBuilder(
    column: $table.updatedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawJson => $composableBuilder(
    column: $table.rawJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalFinanceTransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalFinanceTransactionsTable> {
  $$LocalFinanceTransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantId => $composableBuilder(
    column: $table.tenantId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get academyId => $composableBuilder(
    column: $table.academyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedBy => $composableBuilder(
    column: $table.updatedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawJson => $composableBuilder(
    column: $table.rawJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalFinanceTransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalFinanceTransactionsTable> {
  $$LocalFinanceTransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get tenantId =>
      $composableBuilder(column: $table.tenantId, builder: (column) => column);

  GeneratedColumn<String> get academyId =>
      $composableBuilder(column: $table.academyId, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<String> get updatedBy =>
      $composableBuilder(column: $table.updatedBy, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get rawJson =>
      $composableBuilder(column: $table.rawJson, builder: (column) => column);
}

class $$LocalFinanceTransactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalFinanceTransactionsTable,
          LocalFinanceTransaction,
          $$LocalFinanceTransactionsTableFilterComposer,
          $$LocalFinanceTransactionsTableOrderingComposer,
          $$LocalFinanceTransactionsTableAnnotationComposer,
          $$LocalFinanceTransactionsTableCreateCompanionBuilder,
          $$LocalFinanceTransactionsTableUpdateCompanionBuilder,
          (
            LocalFinanceTransaction,
            BaseReferences<
              _$AppDatabase,
              $LocalFinanceTransactionsTable,
              LocalFinanceTransaction
            >,
          ),
          LocalFinanceTransaction,
          PrefetchHooks Function()
        > {
  $$LocalFinanceTransactionsTableTableManager(
    _$AppDatabase db,
    $LocalFinanceTransactionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalFinanceTransactionsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$LocalFinanceTransactionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LocalFinanceTransactionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                Value<String?> tenantId = const Value.absent(),
                Value<String?> academyId = const Value.absent(),
                Value<String> ownerId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String?> createdBy = const Value.absent(),
                Value<String?> updatedBy = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> occurredAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime> clientUpdatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastSyncError = const Value.absent(),
                Value<int?> version = const Value.absent(),
                Value<String?> rawJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalFinanceTransactionsCompanion(
                localId: localId,
                serverId: serverId,
                tenantId: tenantId,
                academyId: academyId,
                ownerId: ownerId,
                userId: userId,
                createdBy: createdBy,
                updatedBy: updatedBy,
                type: type,
                category: category,
                amount: amount,
                description: description,
                occurredAt: occurredAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                clientUpdatedAt: clientUpdatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                lastSyncError: lastSyncError,
                version: version,
                rawJson: rawJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String localId,
                Value<String?> serverId = const Value.absent(),
                Value<String?> tenantId = const Value.absent(),
                Value<String?> academyId = const Value.absent(),
                required String ownerId,
                required String userId,
                Value<String?> createdBy = const Value.absent(),
                Value<String?> updatedBy = const Value.absent(),
                required String type,
                required String category,
                required double amount,
                required String description,
                required DateTime occurredAt,
                required DateTime createdAt,
                required DateTime updatedAt,
                required DateTime clientUpdatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastSyncError = const Value.absent(),
                Value<int?> version = const Value.absent(),
                Value<String?> rawJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalFinanceTransactionsCompanion.insert(
                localId: localId,
                serverId: serverId,
                tenantId: tenantId,
                academyId: academyId,
                ownerId: ownerId,
                userId: userId,
                createdBy: createdBy,
                updatedBy: updatedBy,
                type: type,
                category: category,
                amount: amount,
                description: description,
                occurredAt: occurredAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                clientUpdatedAt: clientUpdatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                lastSyncError: lastSyncError,
                version: version,
                rawJson: rawJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalFinanceTransactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalFinanceTransactionsTable,
      LocalFinanceTransaction,
      $$LocalFinanceTransactionsTableFilterComposer,
      $$LocalFinanceTransactionsTableOrderingComposer,
      $$LocalFinanceTransactionsTableAnnotationComposer,
      $$LocalFinanceTransactionsTableCreateCompanionBuilder,
      $$LocalFinanceTransactionsTableUpdateCompanionBuilder,
      (
        LocalFinanceTransaction,
        BaseReferences<
          _$AppDatabase,
          $LocalFinanceTransactionsTable,
          LocalFinanceTransaction
        >,
      ),
      LocalFinanceTransaction,
      PrefetchHooks Function()
    >;
typedef $$LocalMessagesTableCreateCompanionBuilder =
    LocalMessagesCompanion Function({
      required String localId,
      Value<String?> serverId,
      Value<String?> tenantId,
      Value<String?> academyId,
      required String ownerId,
      required String userId,
      Value<String?> createdBy,
      Value<String?> updatedBy,
      Value<String?> playerLocalId,
      Value<String?> playerServerId,
      required String recipient,
      required String channel,
      required String body,
      Value<String> status,
      Value<DateTime?> scheduledAt,
      Value<DateTime?> sentAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      required DateTime clientUpdatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> lastSyncError,
      Value<int?> version,
      Value<String?> rawJson,
      Value<int> rowid,
    });
typedef $$LocalMessagesTableUpdateCompanionBuilder =
    LocalMessagesCompanion Function({
      Value<String> localId,
      Value<String?> serverId,
      Value<String?> tenantId,
      Value<String?> academyId,
      Value<String> ownerId,
      Value<String> userId,
      Value<String?> createdBy,
      Value<String?> updatedBy,
      Value<String?> playerLocalId,
      Value<String?> playerServerId,
      Value<String> recipient,
      Value<String> channel,
      Value<String> body,
      Value<String> status,
      Value<DateTime?> scheduledAt,
      Value<DateTime?> sentAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime> clientUpdatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> lastSyncError,
      Value<int?> version,
      Value<String?> rawJson,
      Value<int> rowid,
    });

class $$LocalMessagesTableFilterComposer
    extends Composer<_$AppDatabase, $LocalMessagesTable> {
  $$LocalMessagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantId => $composableBuilder(
    column: $table.tenantId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get academyId => $composableBuilder(
    column: $table.academyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedBy => $composableBuilder(
    column: $table.updatedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get playerLocalId => $composableBuilder(
    column: $table.playerLocalId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get playerServerId => $composableBuilder(
    column: $table.playerServerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recipient => $composableBuilder(
    column: $table.recipient,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get channel => $composableBuilder(
    column: $table.channel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get sentAt => $composableBuilder(
    column: $table.sentAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawJson => $composableBuilder(
    column: $table.rawJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalMessagesTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalMessagesTable> {
  $$LocalMessagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantId => $composableBuilder(
    column: $table.tenantId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get academyId => $composableBuilder(
    column: $table.academyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedBy => $composableBuilder(
    column: $table.updatedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get playerLocalId => $composableBuilder(
    column: $table.playerLocalId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get playerServerId => $composableBuilder(
    column: $table.playerServerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recipient => $composableBuilder(
    column: $table.recipient,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get channel => $composableBuilder(
    column: $table.channel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get sentAt => $composableBuilder(
    column: $table.sentAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawJson => $composableBuilder(
    column: $table.rawJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalMessagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalMessagesTable> {
  $$LocalMessagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get tenantId =>
      $composableBuilder(column: $table.tenantId, builder: (column) => column);

  GeneratedColumn<String> get academyId =>
      $composableBuilder(column: $table.academyId, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<String> get updatedBy =>
      $composableBuilder(column: $table.updatedBy, builder: (column) => column);

  GeneratedColumn<String> get playerLocalId => $composableBuilder(
    column: $table.playerLocalId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get playerServerId => $composableBuilder(
    column: $table.playerServerId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recipient =>
      $composableBuilder(column: $table.recipient, builder: (column) => column);

  GeneratedColumn<String> get channel =>
      $composableBuilder(column: $table.channel, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get sentAt =>
      $composableBuilder(column: $table.sentAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get rawJson =>
      $composableBuilder(column: $table.rawJson, builder: (column) => column);
}

class $$LocalMessagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalMessagesTable,
          LocalMessage,
          $$LocalMessagesTableFilterComposer,
          $$LocalMessagesTableOrderingComposer,
          $$LocalMessagesTableAnnotationComposer,
          $$LocalMessagesTableCreateCompanionBuilder,
          $$LocalMessagesTableUpdateCompanionBuilder,
          (
            LocalMessage,
            BaseReferences<_$AppDatabase, $LocalMessagesTable, LocalMessage>,
          ),
          LocalMessage,
          PrefetchHooks Function()
        > {
  $$LocalMessagesTableTableManager(_$AppDatabase db, $LocalMessagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalMessagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalMessagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalMessagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                Value<String?> tenantId = const Value.absent(),
                Value<String?> academyId = const Value.absent(),
                Value<String> ownerId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String?> createdBy = const Value.absent(),
                Value<String?> updatedBy = const Value.absent(),
                Value<String?> playerLocalId = const Value.absent(),
                Value<String?> playerServerId = const Value.absent(),
                Value<String> recipient = const Value.absent(),
                Value<String> channel = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> scheduledAt = const Value.absent(),
                Value<DateTime?> sentAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime> clientUpdatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastSyncError = const Value.absent(),
                Value<int?> version = const Value.absent(),
                Value<String?> rawJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalMessagesCompanion(
                localId: localId,
                serverId: serverId,
                tenantId: tenantId,
                academyId: academyId,
                ownerId: ownerId,
                userId: userId,
                createdBy: createdBy,
                updatedBy: updatedBy,
                playerLocalId: playerLocalId,
                playerServerId: playerServerId,
                recipient: recipient,
                channel: channel,
                body: body,
                status: status,
                scheduledAt: scheduledAt,
                sentAt: sentAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                clientUpdatedAt: clientUpdatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                lastSyncError: lastSyncError,
                version: version,
                rawJson: rawJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String localId,
                Value<String?> serverId = const Value.absent(),
                Value<String?> tenantId = const Value.absent(),
                Value<String?> academyId = const Value.absent(),
                required String ownerId,
                required String userId,
                Value<String?> createdBy = const Value.absent(),
                Value<String?> updatedBy = const Value.absent(),
                Value<String?> playerLocalId = const Value.absent(),
                Value<String?> playerServerId = const Value.absent(),
                required String recipient,
                required String channel,
                required String body,
                Value<String> status = const Value.absent(),
                Value<DateTime?> scheduledAt = const Value.absent(),
                Value<DateTime?> sentAt = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                required DateTime clientUpdatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastSyncError = const Value.absent(),
                Value<int?> version = const Value.absent(),
                Value<String?> rawJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalMessagesCompanion.insert(
                localId: localId,
                serverId: serverId,
                tenantId: tenantId,
                academyId: academyId,
                ownerId: ownerId,
                userId: userId,
                createdBy: createdBy,
                updatedBy: updatedBy,
                playerLocalId: playerLocalId,
                playerServerId: playerServerId,
                recipient: recipient,
                channel: channel,
                body: body,
                status: status,
                scheduledAt: scheduledAt,
                sentAt: sentAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                clientUpdatedAt: clientUpdatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                lastSyncError: lastSyncError,
                version: version,
                rawJson: rawJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalMessagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalMessagesTable,
      LocalMessage,
      $$LocalMessagesTableFilterComposer,
      $$LocalMessagesTableOrderingComposer,
      $$LocalMessagesTableAnnotationComposer,
      $$LocalMessagesTableCreateCompanionBuilder,
      $$LocalMessagesTableUpdateCompanionBuilder,
      (
        LocalMessage,
        BaseReferences<_$AppDatabase, $LocalMessagesTable, LocalMessage>,
      ),
      LocalMessage,
      PrefetchHooks Function()
    >;
typedef $$LocalNotificationsTableCreateCompanionBuilder =
    LocalNotificationsCompanion Function({
      required String localId,
      Value<String?> serverId,
      Value<String?> tenantId,
      Value<String?> academyId,
      required String ownerId,
      required String userId,
      Value<String?> createdBy,
      Value<String?> updatedBy,
      required String title,
      required String body,
      Value<String> type,
      Value<bool> isRead,
      required DateTime createdAt,
      required DateTime updatedAt,
      required DateTime clientUpdatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> lastSyncError,
      Value<int?> version,
      Value<String?> rawJson,
      Value<int> rowid,
    });
typedef $$LocalNotificationsTableUpdateCompanionBuilder =
    LocalNotificationsCompanion Function({
      Value<String> localId,
      Value<String?> serverId,
      Value<String?> tenantId,
      Value<String?> academyId,
      Value<String> ownerId,
      Value<String> userId,
      Value<String?> createdBy,
      Value<String?> updatedBy,
      Value<String> title,
      Value<String> body,
      Value<String> type,
      Value<bool> isRead,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime> clientUpdatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> lastSyncError,
      Value<int?> version,
      Value<String?> rawJson,
      Value<int> rowid,
    });

class $$LocalNotificationsTableFilterComposer
    extends Composer<_$AppDatabase, $LocalNotificationsTable> {
  $$LocalNotificationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantId => $composableBuilder(
    column: $table.tenantId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get academyId => $composableBuilder(
    column: $table.academyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedBy => $composableBuilder(
    column: $table.updatedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRead => $composableBuilder(
    column: $table.isRead,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawJson => $composableBuilder(
    column: $table.rawJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalNotificationsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalNotificationsTable> {
  $$LocalNotificationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantId => $composableBuilder(
    column: $table.tenantId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get academyId => $composableBuilder(
    column: $table.academyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedBy => $composableBuilder(
    column: $table.updatedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRead => $composableBuilder(
    column: $table.isRead,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawJson => $composableBuilder(
    column: $table.rawJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalNotificationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalNotificationsTable> {
  $$LocalNotificationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get tenantId =>
      $composableBuilder(column: $table.tenantId, builder: (column) => column);

  GeneratedColumn<String> get academyId =>
      $composableBuilder(column: $table.academyId, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<String> get updatedBy =>
      $composableBuilder(column: $table.updatedBy, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get isRead =>
      $composableBuilder(column: $table.isRead, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get rawJson =>
      $composableBuilder(column: $table.rawJson, builder: (column) => column);
}

class $$LocalNotificationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalNotificationsTable,
          LocalNotification,
          $$LocalNotificationsTableFilterComposer,
          $$LocalNotificationsTableOrderingComposer,
          $$LocalNotificationsTableAnnotationComposer,
          $$LocalNotificationsTableCreateCompanionBuilder,
          $$LocalNotificationsTableUpdateCompanionBuilder,
          (
            LocalNotification,
            BaseReferences<
              _$AppDatabase,
              $LocalNotificationsTable,
              LocalNotification
            >,
          ),
          LocalNotification,
          PrefetchHooks Function()
        > {
  $$LocalNotificationsTableTableManager(
    _$AppDatabase db,
    $LocalNotificationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalNotificationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalNotificationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalNotificationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> localId = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                Value<String?> tenantId = const Value.absent(),
                Value<String?> academyId = const Value.absent(),
                Value<String> ownerId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String?> createdBy = const Value.absent(),
                Value<String?> updatedBy = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<bool> isRead = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime> clientUpdatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastSyncError = const Value.absent(),
                Value<int?> version = const Value.absent(),
                Value<String?> rawJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalNotificationsCompanion(
                localId: localId,
                serverId: serverId,
                tenantId: tenantId,
                academyId: academyId,
                ownerId: ownerId,
                userId: userId,
                createdBy: createdBy,
                updatedBy: updatedBy,
                title: title,
                body: body,
                type: type,
                isRead: isRead,
                createdAt: createdAt,
                updatedAt: updatedAt,
                clientUpdatedAt: clientUpdatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                lastSyncError: lastSyncError,
                version: version,
                rawJson: rawJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String localId,
                Value<String?> serverId = const Value.absent(),
                Value<String?> tenantId = const Value.absent(),
                Value<String?> academyId = const Value.absent(),
                required String ownerId,
                required String userId,
                Value<String?> createdBy = const Value.absent(),
                Value<String?> updatedBy = const Value.absent(),
                required String title,
                required String body,
                Value<String> type = const Value.absent(),
                Value<bool> isRead = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                required DateTime clientUpdatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> lastSyncError = const Value.absent(),
                Value<int?> version = const Value.absent(),
                Value<String?> rawJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalNotificationsCompanion.insert(
                localId: localId,
                serverId: serverId,
                tenantId: tenantId,
                academyId: academyId,
                ownerId: ownerId,
                userId: userId,
                createdBy: createdBy,
                updatedBy: updatedBy,
                title: title,
                body: body,
                type: type,
                isRead: isRead,
                createdAt: createdAt,
                updatedAt: updatedAt,
                clientUpdatedAt: clientUpdatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                lastSyncError: lastSyncError,
                version: version,
                rawJson: rawJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalNotificationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalNotificationsTable,
      LocalNotification,
      $$LocalNotificationsTableFilterComposer,
      $$LocalNotificationsTableOrderingComposer,
      $$LocalNotificationsTableAnnotationComposer,
      $$LocalNotificationsTableCreateCompanionBuilder,
      $$LocalNotificationsTableUpdateCompanionBuilder,
      (
        LocalNotification,
        BaseReferences<
          _$AppDatabase,
          $LocalNotificationsTable,
          LocalNotification
        >,
      ),
      LocalNotification,
      PrefetchHooks Function()
    >;
typedef $$SyncOutboxTableCreateCompanionBuilder =
    SyncOutboxCompanion Function({
      required String id,
      required String operationId,
      Value<String?> tenantId,
      Value<String?> academyId,
      required String ownerId,
      required String userId,
      required String entityType,
      required String entityLocalId,
      Value<String?> entityServerId,
      required String action,
      required String payloadJson,
      required String idempotencyKey,
      Value<String> status,
      Value<int> retryCount,
      Value<String?> lastError,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$SyncOutboxTableUpdateCompanionBuilder =
    SyncOutboxCompanion Function({
      Value<String> id,
      Value<String> operationId,
      Value<String?> tenantId,
      Value<String?> academyId,
      Value<String> ownerId,
      Value<String> userId,
      Value<String> entityType,
      Value<String> entityLocalId,
      Value<String?> entityServerId,
      Value<String> action,
      Value<String> payloadJson,
      Value<String> idempotencyKey,
      Value<String> status,
      Value<int> retryCount,
      Value<String?> lastError,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$SyncOutboxTableFilterComposer
    extends Composer<_$AppDatabase, $SyncOutboxTable> {
  $$SyncOutboxTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantId => $composableBuilder(
    column: $table.tenantId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get academyId => $composableBuilder(
    column: $table.academyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityLocalId => $composableBuilder(
    column: $table.entityLocalId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityServerId => $composableBuilder(
    column: $table.entityServerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncOutboxTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncOutboxTable> {
  $$SyncOutboxTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantId => $composableBuilder(
    column: $table.tenantId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get academyId => $composableBuilder(
    column: $table.academyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityLocalId => $composableBuilder(
    column: $table.entityLocalId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityServerId => $composableBuilder(
    column: $table.entityServerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncOutboxTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncOutboxTable> {
  $$SyncOutboxTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tenantId =>
      $composableBuilder(column: $table.tenantId, builder: (column) => column);

  GeneratedColumn<String> get academyId =>
      $composableBuilder(column: $table.academyId, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityLocalId => $composableBuilder(
    column: $table.entityLocalId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityServerId => $composableBuilder(
    column: $table.entityServerId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SyncOutboxTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncOutboxTable,
          SyncOutboxData,
          $$SyncOutboxTableFilterComposer,
          $$SyncOutboxTableOrderingComposer,
          $$SyncOutboxTableAnnotationComposer,
          $$SyncOutboxTableCreateCompanionBuilder,
          $$SyncOutboxTableUpdateCompanionBuilder,
          (
            SyncOutboxData,
            BaseReferences<_$AppDatabase, $SyncOutboxTable, SyncOutboxData>,
          ),
          SyncOutboxData,
          PrefetchHooks Function()
        > {
  $$SyncOutboxTableTableManager(_$AppDatabase db, $SyncOutboxTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncOutboxTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncOutboxTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncOutboxTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> operationId = const Value.absent(),
                Value<String?> tenantId = const Value.absent(),
                Value<String?> academyId = const Value.absent(),
                Value<String> ownerId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityLocalId = const Value.absent(),
                Value<String?> entityServerId = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<String> payloadJson = const Value.absent(),
                Value<String> idempotencyKey = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncOutboxCompanion(
                id: id,
                operationId: operationId,
                tenantId: tenantId,
                academyId: academyId,
                ownerId: ownerId,
                userId: userId,
                entityType: entityType,
                entityLocalId: entityLocalId,
                entityServerId: entityServerId,
                action: action,
                payloadJson: payloadJson,
                idempotencyKey: idempotencyKey,
                status: status,
                retryCount: retryCount,
                lastError: lastError,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String operationId,
                Value<String?> tenantId = const Value.absent(),
                Value<String?> academyId = const Value.absent(),
                required String ownerId,
                required String userId,
                required String entityType,
                required String entityLocalId,
                Value<String?> entityServerId = const Value.absent(),
                required String action,
                required String payloadJson,
                required String idempotencyKey,
                Value<String> status = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SyncOutboxCompanion.insert(
                id: id,
                operationId: operationId,
                tenantId: tenantId,
                academyId: academyId,
                ownerId: ownerId,
                userId: userId,
                entityType: entityType,
                entityLocalId: entityLocalId,
                entityServerId: entityServerId,
                action: action,
                payloadJson: payloadJson,
                idempotencyKey: idempotencyKey,
                status: status,
                retryCount: retryCount,
                lastError: lastError,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncOutboxTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncOutboxTable,
      SyncOutboxData,
      $$SyncOutboxTableFilterComposer,
      $$SyncOutboxTableOrderingComposer,
      $$SyncOutboxTableAnnotationComposer,
      $$SyncOutboxTableCreateCompanionBuilder,
      $$SyncOutboxTableUpdateCompanionBuilder,
      (
        SyncOutboxData,
        BaseReferences<_$AppDatabase, $SyncOutboxTable, SyncOutboxData>,
      ),
      SyncOutboxData,
      PrefetchHooks Function()
    >;
typedef $$SessionStateTableCreateCompanionBuilder =
    SessionStateCompanion Function({
      required String userId,
      Value<String?> tenantId,
      Value<String?> academyId,
      required String email,
      required String role,
      required DateTime lastOnlineAt,
      required DateTime localSessionExpiresAt,
      Value<bool> isLastOnlineSession,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$SessionStateTableUpdateCompanionBuilder =
    SessionStateCompanion Function({
      Value<String> userId,
      Value<String?> tenantId,
      Value<String?> academyId,
      Value<String> email,
      Value<String> role,
      Value<DateTime> lastOnlineAt,
      Value<DateTime> localSessionExpiresAt,
      Value<bool> isLastOnlineSession,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$SessionStateTableFilterComposer
    extends Composer<_$AppDatabase, $SessionStateTable> {
  $$SessionStateTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantId => $composableBuilder(
    column: $table.tenantId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get academyId => $composableBuilder(
    column: $table.academyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastOnlineAt => $composableBuilder(
    column: $table.lastOnlineAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get localSessionExpiresAt => $composableBuilder(
    column: $table.localSessionExpiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLastOnlineSession => $composableBuilder(
    column: $table.isLastOnlineSession,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SessionStateTableOrderingComposer
    extends Composer<_$AppDatabase, $SessionStateTable> {
  $$SessionStateTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantId => $composableBuilder(
    column: $table.tenantId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get academyId => $composableBuilder(
    column: $table.academyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastOnlineAt => $composableBuilder(
    column: $table.lastOnlineAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get localSessionExpiresAt => $composableBuilder(
    column: $table.localSessionExpiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLastOnlineSession => $composableBuilder(
    column: $table.isLastOnlineSession,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SessionStateTableAnnotationComposer
    extends Composer<_$AppDatabase, $SessionStateTable> {
  $$SessionStateTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get tenantId =>
      $composableBuilder(column: $table.tenantId, builder: (column) => column);

  GeneratedColumn<String> get academyId =>
      $composableBuilder(column: $table.academyId, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<DateTime> get lastOnlineAt => $composableBuilder(
    column: $table.lastOnlineAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get localSessionExpiresAt => $composableBuilder(
    column: $table.localSessionExpiresAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isLastOnlineSession => $composableBuilder(
    column: $table.isLastOnlineSession,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SessionStateTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SessionStateTable,
          SessionStateData,
          $$SessionStateTableFilterComposer,
          $$SessionStateTableOrderingComposer,
          $$SessionStateTableAnnotationComposer,
          $$SessionStateTableCreateCompanionBuilder,
          $$SessionStateTableUpdateCompanionBuilder,
          (
            SessionStateData,
            BaseReferences<_$AppDatabase, $SessionStateTable, SessionStateData>,
          ),
          SessionStateData,
          PrefetchHooks Function()
        > {
  $$SessionStateTableTableManager(_$AppDatabase db, $SessionStateTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionStateTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionStateTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionStateTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> userId = const Value.absent(),
                Value<String?> tenantId = const Value.absent(),
                Value<String?> academyId = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<DateTime> lastOnlineAt = const Value.absent(),
                Value<DateTime> localSessionExpiresAt = const Value.absent(),
                Value<bool> isLastOnlineSession = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SessionStateCompanion(
                userId: userId,
                tenantId: tenantId,
                academyId: academyId,
                email: email,
                role: role,
                lastOnlineAt: lastOnlineAt,
                localSessionExpiresAt: localSessionExpiresAt,
                isLastOnlineSession: isLastOnlineSession,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userId,
                Value<String?> tenantId = const Value.absent(),
                Value<String?> academyId = const Value.absent(),
                required String email,
                required String role,
                required DateTime lastOnlineAt,
                required DateTime localSessionExpiresAt,
                Value<bool> isLastOnlineSession = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SessionStateCompanion.insert(
                userId: userId,
                tenantId: tenantId,
                academyId: academyId,
                email: email,
                role: role,
                lastOnlineAt: lastOnlineAt,
                localSessionExpiresAt: localSessionExpiresAt,
                isLastOnlineSession: isLastOnlineSession,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SessionStateTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SessionStateTable,
      SessionStateData,
      $$SessionStateTableFilterComposer,
      $$SessionStateTableOrderingComposer,
      $$SessionStateTableAnnotationComposer,
      $$SessionStateTableCreateCompanionBuilder,
      $$SessionStateTableUpdateCompanionBuilder,
      (
        SessionStateData,
        BaseReferences<_$AppDatabase, $SessionStateTable, SessionStateData>,
      ),
      SessionStateData,
      PrefetchHooks Function()
    >;
typedef $$SyncMetaTableCreateCompanionBuilder =
    SyncMetaCompanion Function({
      required String ownerId,
      required String userId,
      Value<String?> tenantId,
      Value<String?> academyId,
      Value<DateTime?> lastPulledAt,
      Value<DateTime?> lastPushedAt,
      Value<DateTime?> serverTime,
      Value<String?> lastSyncError,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$SyncMetaTableUpdateCompanionBuilder =
    SyncMetaCompanion Function({
      Value<String> ownerId,
      Value<String> userId,
      Value<String?> tenantId,
      Value<String?> academyId,
      Value<DateTime?> lastPulledAt,
      Value<DateTime?> lastPushedAt,
      Value<DateTime?> serverTime,
      Value<String?> lastSyncError,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$SyncMetaTableFilterComposer
    extends Composer<_$AppDatabase, $SyncMetaTable> {
  $$SyncMetaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantId => $composableBuilder(
    column: $table.tenantId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get academyId => $composableBuilder(
    column: $table.academyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastPulledAt => $composableBuilder(
    column: $table.lastPulledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastPushedAt => $composableBuilder(
    column: $table.lastPushedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serverTime => $composableBuilder(
    column: $table.serverTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncMetaTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncMetaTable> {
  $$SyncMetaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantId => $composableBuilder(
    column: $table.tenantId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get academyId => $composableBuilder(
    column: $table.academyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastPulledAt => $composableBuilder(
    column: $table.lastPulledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastPushedAt => $composableBuilder(
    column: $table.lastPushedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serverTime => $composableBuilder(
    column: $table.serverTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncMetaTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncMetaTable> {
  $$SyncMetaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get tenantId =>
      $composableBuilder(column: $table.tenantId, builder: (column) => column);

  GeneratedColumn<String> get academyId =>
      $composableBuilder(column: $table.academyId, builder: (column) => column);

  GeneratedColumn<DateTime> get lastPulledAt => $composableBuilder(
    column: $table.lastPulledAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastPushedAt => $composableBuilder(
    column: $table.lastPushedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get serverTime => $composableBuilder(
    column: $table.serverTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SyncMetaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncMetaTable,
          SyncMetaData,
          $$SyncMetaTableFilterComposer,
          $$SyncMetaTableOrderingComposer,
          $$SyncMetaTableAnnotationComposer,
          $$SyncMetaTableCreateCompanionBuilder,
          $$SyncMetaTableUpdateCompanionBuilder,
          (
            SyncMetaData,
            BaseReferences<_$AppDatabase, $SyncMetaTable, SyncMetaData>,
          ),
          SyncMetaData,
          PrefetchHooks Function()
        > {
  $$SyncMetaTableTableManager(_$AppDatabase db, $SyncMetaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncMetaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncMetaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncMetaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> ownerId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String?> tenantId = const Value.absent(),
                Value<String?> academyId = const Value.absent(),
                Value<DateTime?> lastPulledAt = const Value.absent(),
                Value<DateTime?> lastPushedAt = const Value.absent(),
                Value<DateTime?> serverTime = const Value.absent(),
                Value<String?> lastSyncError = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncMetaCompanion(
                ownerId: ownerId,
                userId: userId,
                tenantId: tenantId,
                academyId: academyId,
                lastPulledAt: lastPulledAt,
                lastPushedAt: lastPushedAt,
                serverTime: serverTime,
                lastSyncError: lastSyncError,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String ownerId,
                required String userId,
                Value<String?> tenantId = const Value.absent(),
                Value<String?> academyId = const Value.absent(),
                Value<DateTime?> lastPulledAt = const Value.absent(),
                Value<DateTime?> lastPushedAt = const Value.absent(),
                Value<DateTime?> serverTime = const Value.absent(),
                Value<String?> lastSyncError = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SyncMetaCompanion.insert(
                ownerId: ownerId,
                userId: userId,
                tenantId: tenantId,
                academyId: academyId,
                lastPulledAt: lastPulledAt,
                lastPushedAt: lastPushedAt,
                serverTime: serverTime,
                lastSyncError: lastSyncError,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncMetaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncMetaTable,
      SyncMetaData,
      $$SyncMetaTableFilterComposer,
      $$SyncMetaTableOrderingComposer,
      $$SyncMetaTableAnnotationComposer,
      $$SyncMetaTableCreateCompanionBuilder,
      $$SyncMetaTableUpdateCompanionBuilder,
      (
        SyncMetaData,
        BaseReferences<_$AppDatabase, $SyncMetaTable, SyncMetaData>,
      ),
      SyncMetaData,
      PrefetchHooks Function()
    >;
typedef $$EntityMappingsTableCreateCompanionBuilder =
    EntityMappingsCompanion Function({
      required String id,
      Value<String?> tenantId,
      Value<String?> academyId,
      required String ownerId,
      required String userId,
      required String entityType,
      required String localId,
      required String serverId,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$EntityMappingsTableUpdateCompanionBuilder =
    EntityMappingsCompanion Function({
      Value<String> id,
      Value<String?> tenantId,
      Value<String?> academyId,
      Value<String> ownerId,
      Value<String> userId,
      Value<String> entityType,
      Value<String> localId,
      Value<String> serverId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$EntityMappingsTableFilterComposer
    extends Composer<_$AppDatabase, $EntityMappingsTable> {
  $$EntityMappingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenantId => $composableBuilder(
    column: $table.tenantId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get academyId => $composableBuilder(
    column: $table.academyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EntityMappingsTableOrderingComposer
    extends Composer<_$AppDatabase, $EntityMappingsTable> {
  $$EntityMappingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantId => $composableBuilder(
    column: $table.tenantId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get academyId => $composableBuilder(
    column: $table.academyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EntityMappingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EntityMappingsTable> {
  $$EntityMappingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tenantId =>
      $composableBuilder(column: $table.tenantId, builder: (column) => column);

  GeneratedColumn<String> get academyId =>
      $composableBuilder(column: $table.academyId, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$EntityMappingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EntityMappingsTable,
          EntityMapping,
          $$EntityMappingsTableFilterComposer,
          $$EntityMappingsTableOrderingComposer,
          $$EntityMappingsTableAnnotationComposer,
          $$EntityMappingsTableCreateCompanionBuilder,
          $$EntityMappingsTableUpdateCompanionBuilder,
          (
            EntityMapping,
            BaseReferences<_$AppDatabase, $EntityMappingsTable, EntityMapping>,
          ),
          EntityMapping,
          PrefetchHooks Function()
        > {
  $$EntityMappingsTableTableManager(
    _$AppDatabase db,
    $EntityMappingsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EntityMappingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EntityMappingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EntityMappingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> tenantId = const Value.absent(),
                Value<String?> academyId = const Value.absent(),
                Value<String> ownerId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> localId = const Value.absent(),
                Value<String> serverId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EntityMappingsCompanion(
                id: id,
                tenantId: tenantId,
                academyId: academyId,
                ownerId: ownerId,
                userId: userId,
                entityType: entityType,
                localId: localId,
                serverId: serverId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> tenantId = const Value.absent(),
                Value<String?> academyId = const Value.absent(),
                required String ownerId,
                required String userId,
                required String entityType,
                required String localId,
                required String serverId,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => EntityMappingsCompanion.insert(
                id: id,
                tenantId: tenantId,
                academyId: academyId,
                ownerId: ownerId,
                userId: userId,
                entityType: entityType,
                localId: localId,
                serverId: serverId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EntityMappingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EntityMappingsTable,
      EntityMapping,
      $$EntityMappingsTableFilterComposer,
      $$EntityMappingsTableOrderingComposer,
      $$EntityMappingsTableAnnotationComposer,
      $$EntityMappingsTableCreateCompanionBuilder,
      $$EntityMappingsTableUpdateCompanionBuilder,
      (
        EntityMapping,
        BaseReferences<_$AppDatabase, $EntityMappingsTable, EntityMapping>,
      ),
      EntityMapping,
      PrefetchHooks Function()
    >;
typedef $$AdminUsersCacheTableCreateCompanionBuilder =
    AdminUsersCacheCompanion Function({
      required String id,
      required String adminUserId,
      required String email,
      required String payloadJson,
      required DateTime cachedAt,
      Value<int> rowid,
    });
typedef $$AdminUsersCacheTableUpdateCompanionBuilder =
    AdminUsersCacheCompanion Function({
      Value<String> id,
      Value<String> adminUserId,
      Value<String> email,
      Value<String> payloadJson,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$AdminUsersCacheTableFilterComposer
    extends Composer<_$AppDatabase, $AdminUsersCacheTable> {
  $$AdminUsersCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get adminUserId => $composableBuilder(
    column: $table.adminUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AdminUsersCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $AdminUsersCacheTable> {
  $$AdminUsersCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get adminUserId => $composableBuilder(
    column: $table.adminUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AdminUsersCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $AdminUsersCacheTable> {
  $$AdminUsersCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get adminUserId => $composableBuilder(
    column: $table.adminUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$AdminUsersCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AdminUsersCacheTable,
          AdminUsersCacheData,
          $$AdminUsersCacheTableFilterComposer,
          $$AdminUsersCacheTableOrderingComposer,
          $$AdminUsersCacheTableAnnotationComposer,
          $$AdminUsersCacheTableCreateCompanionBuilder,
          $$AdminUsersCacheTableUpdateCompanionBuilder,
          (
            AdminUsersCacheData,
            BaseReferences<
              _$AppDatabase,
              $AdminUsersCacheTable,
              AdminUsersCacheData
            >,
          ),
          AdminUsersCacheData,
          PrefetchHooks Function()
        > {
  $$AdminUsersCacheTableTableManager(
    _$AppDatabase db,
    $AdminUsersCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AdminUsersCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AdminUsersCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AdminUsersCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> adminUserId = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> payloadJson = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AdminUsersCacheCompanion(
                id: id,
                adminUserId: adminUserId,
                email: email,
                payloadJson: payloadJson,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String adminUserId,
                required String email,
                required String payloadJson,
                required DateTime cachedAt,
                Value<int> rowid = const Value.absent(),
              }) => AdminUsersCacheCompanion.insert(
                id: id,
                adminUserId: adminUserId,
                email: email,
                payloadJson: payloadJson,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AdminUsersCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AdminUsersCacheTable,
      AdminUsersCacheData,
      $$AdminUsersCacheTableFilterComposer,
      $$AdminUsersCacheTableOrderingComposer,
      $$AdminUsersCacheTableAnnotationComposer,
      $$AdminUsersCacheTableCreateCompanionBuilder,
      $$AdminUsersCacheTableUpdateCompanionBuilder,
      (
        AdminUsersCacheData,
        BaseReferences<
          _$AppDatabase,
          $AdminUsersCacheTable,
          AdminUsersCacheData
        >,
      ),
      AdminUsersCacheData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LocalPlayersTableTableManager get localPlayers =>
      $$LocalPlayersTableTableManager(_db, _db.localPlayers);
  $$LocalSubscriptionsTableTableManager get localSubscriptions =>
      $$LocalSubscriptionsTableTableManager(_db, _db.localSubscriptions);
  $$LocalEvaluationsTableTableManager get localEvaluations =>
      $$LocalEvaluationsTableTableManager(_db, _db.localEvaluations);
  $$LocalFinanceTransactionsTableTableManager get localFinanceTransactions =>
      $$LocalFinanceTransactionsTableTableManager(
        _db,
        _db.localFinanceTransactions,
      );
  $$LocalMessagesTableTableManager get localMessages =>
      $$LocalMessagesTableTableManager(_db, _db.localMessages);
  $$LocalNotificationsTableTableManager get localNotifications =>
      $$LocalNotificationsTableTableManager(_db, _db.localNotifications);
  $$SyncOutboxTableTableManager get syncOutbox =>
      $$SyncOutboxTableTableManager(_db, _db.syncOutbox);
  $$SessionStateTableTableManager get sessionState =>
      $$SessionStateTableTableManager(_db, _db.sessionState);
  $$SyncMetaTableTableManager get syncMeta =>
      $$SyncMetaTableTableManager(_db, _db.syncMeta);
  $$EntityMappingsTableTableManager get entityMappings =>
      $$EntityMappingsTableTableManager(_db, _db.entityMappings);
  $$AdminUsersCacheTableTableManager get adminUsersCache =>
      $$AdminUsersCacheTableTableManager(_db, _db.adminUsersCache);
}
