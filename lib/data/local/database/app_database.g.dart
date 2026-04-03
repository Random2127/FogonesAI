// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FavouritesTable extends Favourites
    with TableInfo<$FavouritesTable, Favourite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavouritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ingredientsMeta = const VerificationMeta(
    'ingredients',
  );
  @override
  late final GeneratedColumn<String> ingredients = GeneratedColumn<String>(
    'ingredients',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _instructionsMeta = const VerificationMeta(
    'instructions',
  );
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
    'instructions',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
    'time',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    ingredients,
    instructions,
    time,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favourites';
  @override
  VerificationContext validateIntegrity(
    Insertable<Favourite> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('ingredients')) {
      context.handle(
        _ingredientsMeta,
        ingredients.isAcceptableOrUnknown(
          data['ingredients']!,
          _ingredientsMeta,
        ),
      );
    }
    if (data.containsKey('instructions')) {
      context.handle(
        _instructionsMeta,
        instructions.isAcceptableOrUnknown(
          data['instructions']!,
          _instructionsMeta,
        ),
      );
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Favourite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favourite(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      ingredients: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ingredients'],
      ),
      instructions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}instructions'],
      ),
      time: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}time'],
      ),
    );
  }

  @override
  $FavouritesTable createAlias(String alias) {
    return $FavouritesTable(attachedDatabase, alias);
  }
}

class Favourite extends DataClass implements Insertable<Favourite> {
  final int id;
  final String title;
  final String? description;
  final String? ingredients;
  final String? instructions;
  final int? time;
  const Favourite({
    required this.id,
    required this.title,
    this.description,
    this.ingredients,
    this.instructions,
    this.time,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || ingredients != null) {
      map['ingredients'] = Variable<String>(ingredients);
    }
    if (!nullToAbsent || instructions != null) {
      map['instructions'] = Variable<String>(instructions);
    }
    if (!nullToAbsent || time != null) {
      map['time'] = Variable<int>(time);
    }
    return map;
  }

  FavouritesCompanion toCompanion(bool nullToAbsent) {
    return FavouritesCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      ingredients: ingredients == null && nullToAbsent
          ? const Value.absent()
          : Value(ingredients),
      instructions: instructions == null && nullToAbsent
          ? const Value.absent()
          : Value(instructions),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
    );
  }

  factory Favourite.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favourite(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      ingredients: serializer.fromJson<String?>(json['ingredients']),
      instructions: serializer.fromJson<String?>(json['instructions']),
      time: serializer.fromJson<int?>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'ingredients': serializer.toJson<String?>(ingredients),
      'instructions': serializer.toJson<String?>(instructions),
      'time': serializer.toJson<int?>(time),
    };
  }

  Favourite copyWith({
    int? id,
    String? title,
    Value<String?> description = const Value.absent(),
    Value<String?> ingredients = const Value.absent(),
    Value<String?> instructions = const Value.absent(),
    Value<int?> time = const Value.absent(),
  }) => Favourite(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    ingredients: ingredients.present ? ingredients.value : this.ingredients,
    instructions: instructions.present ? instructions.value : this.instructions,
    time: time.present ? time.value : this.time,
  );
  Favourite copyWithCompanion(FavouritesCompanion data) {
    return Favourite(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      ingredients: data.ingredients.present
          ? data.ingredients.value
          : this.ingredients,
      instructions: data.instructions.present
          ? data.instructions.value
          : this.instructions,
      time: data.time.present ? data.time.value : this.time,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favourite(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('ingredients: $ingredients, ')
          ..write('instructions: $instructions, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, description, ingredients, instructions, time);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favourite &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.ingredients == this.ingredients &&
          other.instructions == this.instructions &&
          other.time == this.time);
}

class FavouritesCompanion extends UpdateCompanion<Favourite> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<String?> ingredients;
  final Value<String?> instructions;
  final Value<int?> time;
  const FavouritesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.ingredients = const Value.absent(),
    this.instructions = const Value.absent(),
    this.time = const Value.absent(),
  });
  FavouritesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    this.ingredients = const Value.absent(),
    this.instructions = const Value.absent(),
    this.time = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Favourite> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? ingredients,
    Expression<String>? instructions,
    Expression<int>? time,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (ingredients != null) 'ingredients': ingredients,
      if (instructions != null) 'instructions': instructions,
      if (time != null) 'time': time,
    });
  }

  FavouritesCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String?>? description,
    Value<String?>? ingredients,
    Value<String?>? instructions,
    Value<int?>? time,
  }) {
    return FavouritesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
      time: time ?? this.time,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (ingredients.present) {
      map['ingredients'] = Variable<String>(ingredients.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavouritesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('ingredients: $ingredients, ')
          ..write('instructions: $instructions, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavouritesTable favourites = $FavouritesTable(this);
  late final FavouritesDao favouritesDao = FavouritesDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favourites];
}

typedef $$FavouritesTableCreateCompanionBuilder =
    FavouritesCompanion Function({
      Value<int> id,
      required String title,
      Value<String?> description,
      Value<String?> ingredients,
      Value<String?> instructions,
      Value<int?> time,
    });
typedef $$FavouritesTableUpdateCompanionBuilder =
    FavouritesCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String?> description,
      Value<String?> ingredients,
      Value<String?> instructions,
      Value<int?> time,
    });

class $$FavouritesTableFilterComposer
    extends Composer<_$AppDatabase, $FavouritesTable> {
  $$FavouritesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavouritesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavouritesTable> {
  $$FavouritesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavouritesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavouritesTable> {
  $$FavouritesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => column,
  );

  GeneratedColumn<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => column,
  );

  GeneratedColumn<int> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);
}

class $$FavouritesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavouritesTable,
          Favourite,
          $$FavouritesTableFilterComposer,
          $$FavouritesTableOrderingComposer,
          $$FavouritesTableAnnotationComposer,
          $$FavouritesTableCreateCompanionBuilder,
          $$FavouritesTableUpdateCompanionBuilder,
          (
            Favourite,
            BaseReferences<_$AppDatabase, $FavouritesTable, Favourite>,
          ),
          Favourite,
          PrefetchHooks Function()
        > {
  $$FavouritesTableTableManager(_$AppDatabase db, $FavouritesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavouritesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavouritesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavouritesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> ingredients = const Value.absent(),
                Value<String?> instructions = const Value.absent(),
                Value<int?> time = const Value.absent(),
              }) => FavouritesCompanion(
                id: id,
                title: title,
                description: description,
                ingredients: ingredients,
                instructions: instructions,
                time: time,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String?> description = const Value.absent(),
                Value<String?> ingredients = const Value.absent(),
                Value<String?> instructions = const Value.absent(),
                Value<int?> time = const Value.absent(),
              }) => FavouritesCompanion.insert(
                id: id,
                title: title,
                description: description,
                ingredients: ingredients,
                instructions: instructions,
                time: time,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavouritesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavouritesTable,
      Favourite,
      $$FavouritesTableFilterComposer,
      $$FavouritesTableOrderingComposer,
      $$FavouritesTableAnnotationComposer,
      $$FavouritesTableCreateCompanionBuilder,
      $$FavouritesTableUpdateCompanionBuilder,
      (Favourite, BaseReferences<_$AppDatabase, $FavouritesTable, Favourite>),
      Favourite,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavouritesTableTableManager get favourites =>
      $$FavouritesTableTableManager(_db, _db.favourites);
}
