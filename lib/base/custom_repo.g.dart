// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_repo.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Repo extends DataClass implements Insertable<Repo> {
  final String name;
  final String owner;
  final bool enabled;
  Repo({required this.name, required this.owner, required this.enabled});
  factory Repo.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Repo(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      owner: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}owner'])!,
      enabled: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}enabled'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['owner'] = Variable<String>(owner);
    map['enabled'] = Variable<bool>(enabled);
    return map;
  }

  ReposCompanion toCompanion(bool nullToAbsent) {
    return ReposCompanion(
      name: Value(name),
      owner: Value(owner),
      enabled: Value(enabled),
    );
  }

  factory Repo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Repo(
      name: serializer.fromJson<String>(json['name']),
      owner: serializer.fromJson<String>(json['owner']),
      enabled: serializer.fromJson<bool>(json['enabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'owner': serializer.toJson<String>(owner),
      'enabled': serializer.toJson<bool>(enabled),
    };
  }

  Repo copyWith({String? name, String? owner, bool? enabled}) => Repo(
        name: name ?? this.name,
        owner: owner ?? this.owner,
        enabled: enabled ?? this.enabled,
      );
  @override
  String toString() {
    return (StringBuffer('Repo(')
          ..write('name: $name, ')
          ..write('owner: $owner, ')
          ..write('enabled: $enabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, owner, enabled);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Repo &&
          other.name == this.name &&
          other.owner == this.owner &&
          other.enabled == this.enabled);
}

class ReposCompanion extends UpdateCompanion<Repo> {
  final Value<String> name;
  final Value<String> owner;
  final Value<bool> enabled;
  const ReposCompanion({
    this.name = const Value.absent(),
    this.owner = const Value.absent(),
    this.enabled = const Value.absent(),
  });
  ReposCompanion.insert({
    required String name,
    required String owner,
    required bool enabled,
  })  : name = Value(name),
        owner = Value(owner),
        enabled = Value(enabled);
  static Insertable<Repo> custom({
    Expression<String>? name,
    Expression<String>? owner,
    Expression<bool>? enabled,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (owner != null) 'owner': owner,
      if (enabled != null) 'enabled': enabled,
    });
  }

  ReposCompanion copyWith(
      {Value<String>? name, Value<String>? owner, Value<bool>? enabled}) {
    return ReposCompanion(
      name: name ?? this.name,
      owner: owner ?? this.owner,
      enabled: enabled ?? this.enabled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (owner.present) {
      map['owner'] = Variable<String>(owner.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReposCompanion(')
          ..write('name: $name, ')
          ..write('owner: $owner, ')
          ..write('enabled: $enabled')
          ..write(')'))
        .toString();
  }
}

class $ReposTable extends Repos with TableInfo<$ReposTable, Repo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReposTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 32),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _ownerMeta = const VerificationMeta('owner');
  @override
  late final GeneratedColumn<String?> owner = GeneratedColumn<String?>(
      'owner', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 32),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _enabledMeta = const VerificationMeta('enabled');
  @override
  late final GeneratedColumn<bool?> enabled = GeneratedColumn<bool?>(
      'enabled', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (enabled IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [name, owner, enabled];
  @override
  String get aliasedName => _alias ?? 'repos';
  @override
  String get actualTableName => 'repos';
  @override
  VerificationContext validateIntegrity(Insertable<Repo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('owner')) {
      context.handle(
          _ownerMeta, owner.isAcceptableOrUnknown(data['owner']!, _ownerMeta));
    } else if (isInserting) {
      context.missing(_ownerMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(_enabledMeta,
          enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta));
    } else if (isInserting) {
      context.missing(_enabledMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Repo map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Repo.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ReposTable createAlias(String alias) {
    return $ReposTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ReposTable repos = $ReposTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [repos];
}
