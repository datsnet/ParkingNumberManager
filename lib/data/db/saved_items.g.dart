// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_items.dart';

// ignore_for_file: type=lint
class $SavedItemsTable extends SavedItems
    with TableInfo<$SavedItemsTable, SavedItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavedItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _numberTextMeta =
      const VerificationMeta('numberText');
  @override
  late final GeneratedColumn<String> numberText = GeneratedColumn<String>(
      'number_text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, numberText, location, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'saved_items';
  @override
  VerificationContext validateIntegrity(Insertable<SavedItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('number_text')) {
      context.handle(
          _numberTextMeta,
          numberText.isAcceptableOrUnknown(
              data['number_text']!, _numberTextMeta));
    } else if (isInserting) {
      context.missing(_numberTextMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SavedItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavedItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      numberText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}number_text'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $SavedItemsTable createAlias(String alias) {
    return $SavedItemsTable(attachedDatabase, alias);
  }
}

class SavedItem extends DataClass implements Insertable<SavedItem> {
  final int id;
  final String numberText;
  final String? location;
  final DateTime createdAt;
  const SavedItem(
      {required this.id,
      required this.numberText,
      this.location,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['number_text'] = Variable<String>(numberText);
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SavedItemsCompanion toCompanion(bool nullToAbsent) {
    return SavedItemsCompanion(
      id: Value(id),
      numberText: Value(numberText),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      createdAt: Value(createdAt),
    );
  }

  factory SavedItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavedItem(
      id: serializer.fromJson<int>(json['id']),
      numberText: serializer.fromJson<String>(json['numberText']),
      location: serializer.fromJson<String?>(json['location']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'numberText': serializer.toJson<String>(numberText),
      'location': serializer.toJson<String?>(location),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SavedItem copyWith(
          {int? id,
          String? numberText,
          Value<String?> location = const Value.absent(),
          DateTime? createdAt}) =>
      SavedItem(
        id: id ?? this.id,
        numberText: numberText ?? this.numberText,
        location: location.present ? location.value : this.location,
        createdAt: createdAt ?? this.createdAt,
      );
  SavedItem copyWithCompanion(SavedItemsCompanion data) {
    return SavedItem(
      id: data.id.present ? data.id.value : this.id,
      numberText:
          data.numberText.present ? data.numberText.value : this.numberText,
      location: data.location.present ? data.location.value : this.location,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavedItem(')
          ..write('id: $id, ')
          ..write('numberText: $numberText, ')
          ..write('location: $location, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, numberText, location, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavedItem &&
          other.id == this.id &&
          other.numberText == this.numberText &&
          other.location == this.location &&
          other.createdAt == this.createdAt);
}

class SavedItemsCompanion extends UpdateCompanion<SavedItem> {
  final Value<int> id;
  final Value<String> numberText;
  final Value<String?> location;
  final Value<DateTime> createdAt;
  const SavedItemsCompanion({
    this.id = const Value.absent(),
    this.numberText = const Value.absent(),
    this.location = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SavedItemsCompanion.insert({
    this.id = const Value.absent(),
    required String numberText,
    this.location = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : numberText = Value(numberText);
  static Insertable<SavedItem> custom({
    Expression<int>? id,
    Expression<String>? numberText,
    Expression<String>? location,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (numberText != null) 'number_text': numberText,
      if (location != null) 'location': location,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SavedItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? numberText,
      Value<String?>? location,
      Value<DateTime>? createdAt}) {
    return SavedItemsCompanion(
      id: id ?? this.id,
      numberText: numberText ?? this.numberText,
      location: location ?? this.location,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (numberText.present) {
      map['number_text'] = Variable<String>(numberText.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavedItemsCompanion(')
          ..write('id: $id, ')
          ..write('numberText: $numberText, ')
          ..write('location: $location, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SavedItemsTable savedItems = $SavedItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [savedItems];
}

typedef $$SavedItemsTableCreateCompanionBuilder = SavedItemsCompanion Function({
  Value<int> id,
  required String numberText,
  Value<String?> location,
  Value<DateTime> createdAt,
});
typedef $$SavedItemsTableUpdateCompanionBuilder = SavedItemsCompanion Function({
  Value<int> id,
  Value<String> numberText,
  Value<String?> location,
  Value<DateTime> createdAt,
});

class $$SavedItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SavedItemsTable> {
  $$SavedItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get numberText => $composableBuilder(
      column: $table.numberText, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$SavedItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SavedItemsTable> {
  $$SavedItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get numberText => $composableBuilder(
      column: $table.numberText, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$SavedItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SavedItemsTable> {
  $$SavedItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get numberText => $composableBuilder(
      column: $table.numberText, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SavedItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SavedItemsTable,
    SavedItem,
    $$SavedItemsTableFilterComposer,
    $$SavedItemsTableOrderingComposer,
    $$SavedItemsTableAnnotationComposer,
    $$SavedItemsTableCreateCompanionBuilder,
    $$SavedItemsTableUpdateCompanionBuilder,
    (SavedItem, BaseReferences<_$AppDatabase, $SavedItemsTable, SavedItem>),
    SavedItem,
    PrefetchHooks Function()> {
  $$SavedItemsTableTableManager(_$AppDatabase db, $SavedItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavedItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SavedItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SavedItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> numberText = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              SavedItemsCompanion(
            id: id,
            numberText: numberText,
            location: location,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String numberText,
            Value<String?> location = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              SavedItemsCompanion.insert(
            id: id,
            numberText: numberText,
            location: location,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SavedItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SavedItemsTable,
    SavedItem,
    $$SavedItemsTableFilterComposer,
    $$SavedItemsTableOrderingComposer,
    $$SavedItemsTableAnnotationComposer,
    $$SavedItemsTableCreateCompanionBuilder,
    $$SavedItemsTableUpdateCompanionBuilder,
    (SavedItem, BaseReferences<_$AppDatabase, $SavedItemsTable, SavedItem>),
    SavedItem,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SavedItemsTableTableManager get savedItems =>
      $$SavedItemsTableTableManager(_db, _db.savedItems);
}
