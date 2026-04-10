// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, UserRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userHashMeta = const VerificationMeta(
    'userHash',
  );
  @override
  late final GeneratedColumn<String> userHash = GeneratedColumn<String>(
    'user_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
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
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _passwordHashMeta = const VerificationMeta(
    'passwordHash',
  );
  @override
  late final GeneratedColumn<String> passwordHash = GeneratedColumn<String>(
    'password_hash',
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
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userHash,
    username,
    email,
    passwordHash,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_hash')) {
      context.handle(
        _userHashMeta,
        userHash.isAcceptableOrUnknown(data['user_hash']!, _userHashMeta),
      );
    } else if (isInserting) {
      context.missing(_userHashMeta);
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password_hash')) {
      context.handle(
        _passwordHashMeta,
        passwordHash.isAcceptableOrUnknown(
          data['password_hash']!,
          _passwordHashMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_passwordHashMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_hash'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      passwordHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password_hash'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class UserRow extends DataClass implements Insertable<UserRow> {
  final String id;
  final String userHash;
  final String username;
  final String email;
  final String passwordHash;
  final DateTime? createdAt;
  const UserRow({
    required this.id,
    required this.userHash,
    required this.username,
    required this.email,
    required this.passwordHash,
    this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_hash'] = Variable<String>(userHash);
    map['username'] = Variable<String>(username);
    map['email'] = Variable<String>(email);
    map['password_hash'] = Variable<String>(passwordHash);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      userHash: Value(userHash),
      username: Value(username),
      email: Value(email),
      passwordHash: Value(passwordHash),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory UserRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserRow(
      id: serializer.fromJson<String>(json['id']),
      userHash: serializer.fromJson<String>(json['userHash']),
      username: serializer.fromJson<String>(json['username']),
      email: serializer.fromJson<String>(json['email']),
      passwordHash: serializer.fromJson<String>(json['passwordHash']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userHash': serializer.toJson<String>(userHash),
      'username': serializer.toJson<String>(username),
      'email': serializer.toJson<String>(email),
      'passwordHash': serializer.toJson<String>(passwordHash),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  UserRow copyWith({
    String? id,
    String? userHash,
    String? username,
    String? email,
    String? passwordHash,
    Value<DateTime?> createdAt = const Value.absent(),
  }) => UserRow(
    id: id ?? this.id,
    userHash: userHash ?? this.userHash,
    username: username ?? this.username,
    email: email ?? this.email,
    passwordHash: passwordHash ?? this.passwordHash,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
  );
  UserRow copyWithCompanion(UsersCompanion data) {
    return UserRow(
      id: data.id.present ? data.id.value : this.id,
      userHash: data.userHash.present ? data.userHash.value : this.userHash,
      username: data.username.present ? data.username.value : this.username,
      email: data.email.present ? data.email.value : this.email,
      passwordHash: data.passwordHash.present
          ? data.passwordHash.value
          : this.passwordHash,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserRow(')
          ..write('id: $id, ')
          ..write('userHash: $userHash, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userHash, username, email, passwordHash, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserRow &&
          other.id == this.id &&
          other.userHash == this.userHash &&
          other.username == this.username &&
          other.email == this.email &&
          other.passwordHash == this.passwordHash &&
          other.createdAt == this.createdAt);
}

class UsersCompanion extends UpdateCompanion<UserRow> {
  final Value<String> id;
  final Value<String> userHash;
  final Value<String> username;
  final Value<String> email;
  final Value<String> passwordHash;
  final Value<DateTime?> createdAt;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.userHash = const Value.absent(),
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required String userHash,
    required String username,
    required String email,
    required String passwordHash,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userHash = Value(userHash),
       username = Value(username),
       email = Value(email),
       passwordHash = Value(passwordHash);
  static Insertable<UserRow> custom({
    Expression<String>? id,
    Expression<String>? userHash,
    Expression<String>? username,
    Expression<String>? email,
    Expression<String>? passwordHash,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userHash != null) 'user_hash': userHash,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (passwordHash != null) 'password_hash': passwordHash,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? id,
    Value<String>? userHash,
    Value<String>? username,
    Value<String>? email,
    Value<String>? passwordHash,
    Value<DateTime?>? createdAt,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      userHash: userHash ?? this.userHash,
      username: username ?? this.username,
      email: email ?? this.email,
      passwordHash: passwordHash ?? this.passwordHash,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userHash.present) {
      map['user_hash'] = Variable<String>(userHash.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (passwordHash.present) {
      map['password_hash'] = Variable<String>(passwordHash.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('userHash: $userHash, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DietaryCatalogTable extends DietaryCatalog
    with TableInfo<$DietaryCatalogTable, DietaryOptionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DietaryCatalogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dietary_options';
  @override
  VerificationContext validateIntegrity(
    Insertable<DietaryOptionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DietaryOptionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DietaryOptionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $DietaryCatalogTable createAlias(String alias) {
    return $DietaryCatalogTable(attachedDatabase, alias);
  }
}

class DietaryOptionRow extends DataClass
    implements Insertable<DietaryOptionRow> {
  final String id;
  final String name;
  final String? description;
  const DietaryOptionRow({
    required this.id,
    required this.name,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  DietaryCatalogCompanion toCompanion(bool nullToAbsent) {
    return DietaryCatalogCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory DietaryOptionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DietaryOptionRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
    };
  }

  DietaryOptionRow copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
  }) => DietaryOptionRow(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
  );
  DietaryOptionRow copyWithCompanion(DietaryCatalogCompanion data) {
    return DietaryOptionRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DietaryOptionRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DietaryOptionRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description);
}

class DietaryCatalogCompanion extends UpdateCompanion<DietaryOptionRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<int> rowid;
  const DietaryCatalogCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DietaryCatalogCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<DietaryOptionRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DietaryCatalogCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<int>? rowid,
  }) {
    return DietaryCatalogCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DietaryCatalogCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecipesTable extends Recipes with TableInfo<$RecipesTable, RecipeRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
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
  static const VerificationMeta _prepTimeMeta = const VerificationMeta(
    'prepTime',
  );
  @override
  late final GeneratedColumn<int> prepTime = GeneratedColumn<int>(
    'prep_time',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cookTimeMeta = const VerificationMeta(
    'cookTime',
  );
  @override
  late final GeneratedColumn<int> cookTime = GeneratedColumn<int>(
    'cook_time',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _servingsMeta = const VerificationMeta(
    'servings',
  );
  @override
  late final GeneratedColumn<int> servings = GeneratedColumn<int>(
    'servings',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
    'difficulty',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    title,
    description,
    ingredients,
    instructions,
    prepTime,
    cookTime,
    servings,
    difficulty,
    imageUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipes';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
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
    if (data.containsKey('prep_time')) {
      context.handle(
        _prepTimeMeta,
        prepTime.isAcceptableOrUnknown(data['prep_time']!, _prepTimeMeta),
      );
    }
    if (data.containsKey('cook_time')) {
      context.handle(
        _cookTimeMeta,
        cookTime.isAcceptableOrUnknown(data['cook_time']!, _cookTimeMeta),
      );
    }
    if (data.containsKey('servings')) {
      context.handle(
        _servingsMeta,
        servings.isAcceptableOrUnknown(data['servings']!, _servingsMeta),
      );
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
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
      prepTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}prep_time'],
      ),
      cookTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cook_time'],
      ),
      servings: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}servings'],
      ),
      difficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}difficulty'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
    );
  }

  @override
  $RecipesTable createAlias(String alias) {
    return $RecipesTable(attachedDatabase, alias);
  }
}

class RecipeRow extends DataClass implements Insertable<RecipeRow> {
  final String id;
  final String userId;
  final String title;
  final String? description;
  final String? ingredients;
  final String? instructions;
  final int? prepTime;
  final int? cookTime;
  final int? servings;
  final String? difficulty;
  final String? imageUrl;
  const RecipeRow({
    required this.id,
    required this.userId,
    required this.title,
    this.description,
    this.ingredients,
    this.instructions,
    this.prepTime,
    this.cookTime,
    this.servings,
    this.difficulty,
    this.imageUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
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
    if (!nullToAbsent || prepTime != null) {
      map['prep_time'] = Variable<int>(prepTime);
    }
    if (!nullToAbsent || cookTime != null) {
      map['cook_time'] = Variable<int>(cookTime);
    }
    if (!nullToAbsent || servings != null) {
      map['servings'] = Variable<int>(servings);
    }
    if (!nullToAbsent || difficulty != null) {
      map['difficulty'] = Variable<String>(difficulty);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    return map;
  }

  RecipesCompanion toCompanion(bool nullToAbsent) {
    return RecipesCompanion(
      id: Value(id),
      userId: Value(userId),
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
      prepTime: prepTime == null && nullToAbsent
          ? const Value.absent()
          : Value(prepTime),
      cookTime: cookTime == null && nullToAbsent
          ? const Value.absent()
          : Value(cookTime),
      servings: servings == null && nullToAbsent
          ? const Value.absent()
          : Value(servings),
      difficulty: difficulty == null && nullToAbsent
          ? const Value.absent()
          : Value(difficulty),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
    );
  }

  factory RecipeRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      ingredients: serializer.fromJson<String?>(json['ingredients']),
      instructions: serializer.fromJson<String?>(json['instructions']),
      prepTime: serializer.fromJson<int?>(json['prepTime']),
      cookTime: serializer.fromJson<int?>(json['cookTime']),
      servings: serializer.fromJson<int?>(json['servings']),
      difficulty: serializer.fromJson<String?>(json['difficulty']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'ingredients': serializer.toJson<String?>(ingredients),
      'instructions': serializer.toJson<String?>(instructions),
      'prepTime': serializer.toJson<int?>(prepTime),
      'cookTime': serializer.toJson<int?>(cookTime),
      'servings': serializer.toJson<int?>(servings),
      'difficulty': serializer.toJson<String?>(difficulty),
      'imageUrl': serializer.toJson<String?>(imageUrl),
    };
  }

  RecipeRow copyWith({
    String? id,
    String? userId,
    String? title,
    Value<String?> description = const Value.absent(),
    Value<String?> ingredients = const Value.absent(),
    Value<String?> instructions = const Value.absent(),
    Value<int?> prepTime = const Value.absent(),
    Value<int?> cookTime = const Value.absent(),
    Value<int?> servings = const Value.absent(),
    Value<String?> difficulty = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
  }) => RecipeRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    ingredients: ingredients.present ? ingredients.value : this.ingredients,
    instructions: instructions.present ? instructions.value : this.instructions,
    prepTime: prepTime.present ? prepTime.value : this.prepTime,
    cookTime: cookTime.present ? cookTime.value : this.cookTime,
    servings: servings.present ? servings.value : this.servings,
    difficulty: difficulty.present ? difficulty.value : this.difficulty,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
  );
  RecipeRow copyWithCompanion(RecipesCompanion data) {
    return RecipeRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
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
      prepTime: data.prepTime.present ? data.prepTime.value : this.prepTime,
      cookTime: data.cookTime.present ? data.cookTime.value : this.cookTime,
      servings: data.servings.present ? data.servings.value : this.servings,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('ingredients: $ingredients, ')
          ..write('instructions: $instructions, ')
          ..write('prepTime: $prepTime, ')
          ..write('cookTime: $cookTime, ')
          ..write('servings: $servings, ')
          ..write('difficulty: $difficulty, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    title,
    description,
    ingredients,
    instructions,
    prepTime,
    cookTime,
    servings,
    difficulty,
    imageUrl,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.title == this.title &&
          other.description == this.description &&
          other.ingredients == this.ingredients &&
          other.instructions == this.instructions &&
          other.prepTime == this.prepTime &&
          other.cookTime == this.cookTime &&
          other.servings == this.servings &&
          other.difficulty == this.difficulty &&
          other.imageUrl == this.imageUrl);
}

class RecipesCompanion extends UpdateCompanion<RecipeRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> title;
  final Value<String?> description;
  final Value<String?> ingredients;
  final Value<String?> instructions;
  final Value<int?> prepTime;
  final Value<int?> cookTime;
  final Value<int?> servings;
  final Value<String?> difficulty;
  final Value<String?> imageUrl;
  final Value<int> rowid;
  const RecipesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.ingredients = const Value.absent(),
    this.instructions = const Value.absent(),
    this.prepTime = const Value.absent(),
    this.cookTime = const Value.absent(),
    this.servings = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipesCompanion.insert({
    required String id,
    required String userId,
    required String title,
    this.description = const Value.absent(),
    this.ingredients = const Value.absent(),
    this.instructions = const Value.absent(),
    this.prepTime = const Value.absent(),
    this.cookTime = const Value.absent(),
    this.servings = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       title = Value(title);
  static Insertable<RecipeRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? ingredients,
    Expression<String>? instructions,
    Expression<int>? prepTime,
    Expression<int>? cookTime,
    Expression<int>? servings,
    Expression<String>? difficulty,
    Expression<String>? imageUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (ingredients != null) 'ingredients': ingredients,
      if (instructions != null) 'instructions': instructions,
      if (prepTime != null) 'prep_time': prepTime,
      if (cookTime != null) 'cook_time': cookTime,
      if (servings != null) 'servings': servings,
      if (difficulty != null) 'difficulty': difficulty,
      if (imageUrl != null) 'image_url': imageUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipesCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? title,
    Value<String?>? description,
    Value<String?>? ingredients,
    Value<String?>? instructions,
    Value<int?>? prepTime,
    Value<int?>? cookTime,
    Value<int?>? servings,
    Value<String?>? difficulty,
    Value<String?>? imageUrl,
    Value<int>? rowid,
  }) {
    return RecipesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
      prepTime: prepTime ?? this.prepTime,
      cookTime: cookTime ?? this.cookTime,
      servings: servings ?? this.servings,
      difficulty: difficulty ?? this.difficulty,
      imageUrl: imageUrl ?? this.imageUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
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
    if (prepTime.present) {
      map['prep_time'] = Variable<int>(prepTime.value);
    }
    if (cookTime.present) {
      map['cook_time'] = Variable<int>(cookTime.value);
    }
    if (servings.present) {
      map['servings'] = Variable<int>(servings.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('ingredients: $ingredients, ')
          ..write('instructions: $instructions, ')
          ..write('prepTime: $prepTime, ')
          ..write('cookTime: $cookTime, ')
          ..write('servings: $servings, ')
          ..write('difficulty: $difficulty, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, FavoriteRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipes (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, recipeId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorites';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {userId, recipeId},
  ];
  @override
  FavoriteRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipe_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
    );
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(attachedDatabase, alias);
  }
}

class FavoriteRow extends DataClass implements Insertable<FavoriteRow> {
  final String id;
  final String userId;
  final String recipeId;
  final DateTime? createdAt;
  const FavoriteRow({
    required this.id,
    required this.userId,
    required this.recipeId,
    this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['recipe_id'] = Variable<String>(recipeId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      id: Value(id),
      userId: Value(userId),
      recipeId: Value(recipeId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory FavoriteRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      recipeId: serializer.fromJson<String>(json['recipeId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'recipeId': serializer.toJson<String>(recipeId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  FavoriteRow copyWith({
    String? id,
    String? userId,
    String? recipeId,
    Value<DateTime?> createdAt = const Value.absent(),
  }) => FavoriteRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    recipeId: recipeId ?? this.recipeId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
  );
  FavoriteRow copyWithCompanion(FavoritesCompanion data) {
    return FavoriteRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('recipeId: $recipeId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, recipeId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.recipeId == this.recipeId &&
          other.createdAt == this.createdAt);
}

class FavoritesCompanion extends UpdateCompanion<FavoriteRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> recipeId;
  final Value<DateTime?> createdAt;
  final Value<int> rowid;
  const FavoritesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoritesCompanion.insert({
    required String id,
    required String userId,
    required String recipeId,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       recipeId = Value(recipeId);
  static Insertable<FavoriteRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? recipeId,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (recipeId != null) 'recipe_id': recipeId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoritesCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? recipeId,
    Value<DateTime?>? createdAt,
    Value<int>? rowid,
  }) {
    return FavoritesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      recipeId: recipeId ?? this.recipeId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('recipeId: $recipeId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserDietaryPrefsTable extends UserDietaryPrefs
    with TableInfo<$UserDietaryPrefsTable, UserDietaryPref> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserDietaryPrefsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _dietaryOptionIdMeta = const VerificationMeta(
    'dietaryOptionId',
  );
  @override
  late final GeneratedColumn<String> dietaryOptionId = GeneratedColumn<String>(
    'dietary_option_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES dietary_options (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [userId, dietaryOptionId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_dietary_preferences';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserDietaryPref> instance, {
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
    if (data.containsKey('dietary_option_id')) {
      context.handle(
        _dietaryOptionIdMeta,
        dietaryOptionId.isAcceptableOrUnknown(
          data['dietary_option_id']!,
          _dietaryOptionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dietaryOptionIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId, dietaryOptionId};
  @override
  UserDietaryPref map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDietaryPref(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      dietaryOptionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dietary_option_id'],
      )!,
    );
  }

  @override
  $UserDietaryPrefsTable createAlias(String alias) {
    return $UserDietaryPrefsTable(attachedDatabase, alias);
  }
}

class UserDietaryPref extends DataClass implements Insertable<UserDietaryPref> {
  final String userId;
  final String dietaryOptionId;
  const UserDietaryPref({required this.userId, required this.dietaryOptionId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['dietary_option_id'] = Variable<String>(dietaryOptionId);
    return map;
  }

  UserDietaryPrefsCompanion toCompanion(bool nullToAbsent) {
    return UserDietaryPrefsCompanion(
      userId: Value(userId),
      dietaryOptionId: Value(dietaryOptionId),
    );
  }

  factory UserDietaryPref.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDietaryPref(
      userId: serializer.fromJson<String>(json['userId']),
      dietaryOptionId: serializer.fromJson<String>(json['dietaryOptionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'dietaryOptionId': serializer.toJson<String>(dietaryOptionId),
    };
  }

  UserDietaryPref copyWith({String? userId, String? dietaryOptionId}) =>
      UserDietaryPref(
        userId: userId ?? this.userId,
        dietaryOptionId: dietaryOptionId ?? this.dietaryOptionId,
      );
  UserDietaryPref copyWithCompanion(UserDietaryPrefsCompanion data) {
    return UserDietaryPref(
      userId: data.userId.present ? data.userId.value : this.userId,
      dietaryOptionId: data.dietaryOptionId.present
          ? data.dietaryOptionId.value
          : this.dietaryOptionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserDietaryPref(')
          ..write('userId: $userId, ')
          ..write('dietaryOptionId: $dietaryOptionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, dietaryOptionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDietaryPref &&
          other.userId == this.userId &&
          other.dietaryOptionId == this.dietaryOptionId);
}

class UserDietaryPrefsCompanion extends UpdateCompanion<UserDietaryPref> {
  final Value<String> userId;
  final Value<String> dietaryOptionId;
  final Value<int> rowid;
  const UserDietaryPrefsCompanion({
    this.userId = const Value.absent(),
    this.dietaryOptionId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserDietaryPrefsCompanion.insert({
    required String userId,
    required String dietaryOptionId,
    this.rowid = const Value.absent(),
  }) : userId = Value(userId),
       dietaryOptionId = Value(dietaryOptionId);
  static Insertable<UserDietaryPref> custom({
    Expression<String>? userId,
    Expression<String>? dietaryOptionId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (dietaryOptionId != null) 'dietary_option_id': dietaryOptionId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserDietaryPrefsCompanion copyWith({
    Value<String>? userId,
    Value<String>? dietaryOptionId,
    Value<int>? rowid,
  }) {
    return UserDietaryPrefsCompanion(
      userId: userId ?? this.userId,
      dietaryOptionId: dietaryOptionId ?? this.dietaryOptionId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (dietaryOptionId.present) {
      map['dietary_option_id'] = Variable<String>(dietaryOptionId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDietaryPrefsCompanion(')
          ..write('userId: $userId, ')
          ..write('dietaryOptionId: $dietaryOptionId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecipeDietaryJunctionTable extends RecipeDietaryJunction
    with TableInfo<$RecipeDietaryJunctionTable, RecipeDietaryJunctionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeDietaryJunctionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipes (id)',
    ),
  );
  static const VerificationMeta _dietaryOptionIdMeta = const VerificationMeta(
    'dietaryOptionId',
  );
  @override
  late final GeneratedColumn<String> dietaryOptionId = GeneratedColumn<String>(
    'dietary_option_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES dietary_options (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [recipeId, dietaryOptionId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_dietary_options';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeDietaryJunctionData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('dietary_option_id')) {
      context.handle(
        _dietaryOptionIdMeta,
        dietaryOptionId.isAcceptableOrUnknown(
          data['dietary_option_id']!,
          _dietaryOptionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dietaryOptionIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {recipeId, dietaryOptionId};
  @override
  RecipeDietaryJunctionData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeDietaryJunctionData(
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipe_id'],
      )!,
      dietaryOptionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dietary_option_id'],
      )!,
    );
  }

  @override
  $RecipeDietaryJunctionTable createAlias(String alias) {
    return $RecipeDietaryJunctionTable(attachedDatabase, alias);
  }
}

class RecipeDietaryJunctionData extends DataClass
    implements Insertable<RecipeDietaryJunctionData> {
  final String recipeId;
  final String dietaryOptionId;
  const RecipeDietaryJunctionData({
    required this.recipeId,
    required this.dietaryOptionId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['recipe_id'] = Variable<String>(recipeId);
    map['dietary_option_id'] = Variable<String>(dietaryOptionId);
    return map;
  }

  RecipeDietaryJunctionCompanion toCompanion(bool nullToAbsent) {
    return RecipeDietaryJunctionCompanion(
      recipeId: Value(recipeId),
      dietaryOptionId: Value(dietaryOptionId),
    );
  }

  factory RecipeDietaryJunctionData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeDietaryJunctionData(
      recipeId: serializer.fromJson<String>(json['recipeId']),
      dietaryOptionId: serializer.fromJson<String>(json['dietaryOptionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'recipeId': serializer.toJson<String>(recipeId),
      'dietaryOptionId': serializer.toJson<String>(dietaryOptionId),
    };
  }

  RecipeDietaryJunctionData copyWith({
    String? recipeId,
    String? dietaryOptionId,
  }) => RecipeDietaryJunctionData(
    recipeId: recipeId ?? this.recipeId,
    dietaryOptionId: dietaryOptionId ?? this.dietaryOptionId,
  );
  RecipeDietaryJunctionData copyWithCompanion(
    RecipeDietaryJunctionCompanion data,
  ) {
    return RecipeDietaryJunctionData(
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      dietaryOptionId: data.dietaryOptionId.present
          ? data.dietaryOptionId.value
          : this.dietaryOptionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeDietaryJunctionData(')
          ..write('recipeId: $recipeId, ')
          ..write('dietaryOptionId: $dietaryOptionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(recipeId, dietaryOptionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeDietaryJunctionData &&
          other.recipeId == this.recipeId &&
          other.dietaryOptionId == this.dietaryOptionId);
}

class RecipeDietaryJunctionCompanion
    extends UpdateCompanion<RecipeDietaryJunctionData> {
  final Value<String> recipeId;
  final Value<String> dietaryOptionId;
  final Value<int> rowid;
  const RecipeDietaryJunctionCompanion({
    this.recipeId = const Value.absent(),
    this.dietaryOptionId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipeDietaryJunctionCompanion.insert({
    required String recipeId,
    required String dietaryOptionId,
    this.rowid = const Value.absent(),
  }) : recipeId = Value(recipeId),
       dietaryOptionId = Value(dietaryOptionId);
  static Insertable<RecipeDietaryJunctionData> custom({
    Expression<String>? recipeId,
    Expression<String>? dietaryOptionId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (recipeId != null) 'recipe_id': recipeId,
      if (dietaryOptionId != null) 'dietary_option_id': dietaryOptionId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipeDietaryJunctionCompanion copyWith({
    Value<String>? recipeId,
    Value<String>? dietaryOptionId,
    Value<int>? rowid,
  }) {
    return RecipeDietaryJunctionCompanion(
      recipeId: recipeId ?? this.recipeId,
      dietaryOptionId: dietaryOptionId ?? this.dietaryOptionId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (dietaryOptionId.present) {
      map['dietary_option_id'] = Variable<String>(dietaryOptionId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeDietaryJunctionCompanion(')
          ..write('recipeId: $recipeId, ')
          ..write('dietaryOptionId: $dietaryOptionId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NutritionFactsTable extends NutritionFacts
    with TableInfo<$NutritionFactsTable, NutritionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NutritionFactsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipes (id)',
    ),
  );
  static const VerificationMeta _caloriesMeta = const VerificationMeta(
    'calories',
  );
  @override
  late final GeneratedColumn<int> calories = GeneratedColumn<int>(
    'calories',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _proteinsMeta = const VerificationMeta(
    'proteins',
  );
  @override
  late final GeneratedColumn<double> proteins = GeneratedColumn<double>(
    'proteins',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _carbohydratesMeta = const VerificationMeta(
    'carbohydrates',
  );
  @override
  late final GeneratedColumn<double> carbohydrates = GeneratedColumn<double>(
    'carbohydrates',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fiberMeta = const VerificationMeta('fiber');
  @override
  late final GeneratedColumn<double> fiber = GeneratedColumn<double>(
    'fiber',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    recipeId,
    calories,
    proteins,
    carbohydrates,
    fiber,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nutrition';
  @override
  VerificationContext validateIntegrity(
    Insertable<NutritionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('calories')) {
      context.handle(
        _caloriesMeta,
        calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta),
      );
    }
    if (data.containsKey('proteins')) {
      context.handle(
        _proteinsMeta,
        proteins.isAcceptableOrUnknown(data['proteins']!, _proteinsMeta),
      );
    }
    if (data.containsKey('carbohydrates')) {
      context.handle(
        _carbohydratesMeta,
        carbohydrates.isAcceptableOrUnknown(
          data['carbohydrates']!,
          _carbohydratesMeta,
        ),
      );
    }
    if (data.containsKey('fiber')) {
      context.handle(
        _fiberMeta,
        fiber.isAcceptableOrUnknown(data['fiber']!, _fiberMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NutritionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NutritionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipe_id'],
      )!,
      calories: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}calories'],
      ),
      proteins: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}proteins'],
      ),
      carbohydrates: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}carbohydrates'],
      ),
      fiber: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fiber'],
      ),
    );
  }

  @override
  $NutritionFactsTable createAlias(String alias) {
    return $NutritionFactsTable(attachedDatabase, alias);
  }
}

class NutritionRow extends DataClass implements Insertable<NutritionRow> {
  final String id;
  final String recipeId;
  final int? calories;
  final double? proteins;
  final double? carbohydrates;
  final double? fiber;
  const NutritionRow({
    required this.id,
    required this.recipeId,
    this.calories,
    this.proteins,
    this.carbohydrates,
    this.fiber,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['recipe_id'] = Variable<String>(recipeId);
    if (!nullToAbsent || calories != null) {
      map['calories'] = Variable<int>(calories);
    }
    if (!nullToAbsent || proteins != null) {
      map['proteins'] = Variable<double>(proteins);
    }
    if (!nullToAbsent || carbohydrates != null) {
      map['carbohydrates'] = Variable<double>(carbohydrates);
    }
    if (!nullToAbsent || fiber != null) {
      map['fiber'] = Variable<double>(fiber);
    }
    return map;
  }

  NutritionFactsCompanion toCompanion(bool nullToAbsent) {
    return NutritionFactsCompanion(
      id: Value(id),
      recipeId: Value(recipeId),
      calories: calories == null && nullToAbsent
          ? const Value.absent()
          : Value(calories),
      proteins: proteins == null && nullToAbsent
          ? const Value.absent()
          : Value(proteins),
      carbohydrates: carbohydrates == null && nullToAbsent
          ? const Value.absent()
          : Value(carbohydrates),
      fiber: fiber == null && nullToAbsent
          ? const Value.absent()
          : Value(fiber),
    );
  }

  factory NutritionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NutritionRow(
      id: serializer.fromJson<String>(json['id']),
      recipeId: serializer.fromJson<String>(json['recipeId']),
      calories: serializer.fromJson<int?>(json['calories']),
      proteins: serializer.fromJson<double?>(json['proteins']),
      carbohydrates: serializer.fromJson<double?>(json['carbohydrates']),
      fiber: serializer.fromJson<double?>(json['fiber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'recipeId': serializer.toJson<String>(recipeId),
      'calories': serializer.toJson<int?>(calories),
      'proteins': serializer.toJson<double?>(proteins),
      'carbohydrates': serializer.toJson<double?>(carbohydrates),
      'fiber': serializer.toJson<double?>(fiber),
    };
  }

  NutritionRow copyWith({
    String? id,
    String? recipeId,
    Value<int?> calories = const Value.absent(),
    Value<double?> proteins = const Value.absent(),
    Value<double?> carbohydrates = const Value.absent(),
    Value<double?> fiber = const Value.absent(),
  }) => NutritionRow(
    id: id ?? this.id,
    recipeId: recipeId ?? this.recipeId,
    calories: calories.present ? calories.value : this.calories,
    proteins: proteins.present ? proteins.value : this.proteins,
    carbohydrates: carbohydrates.present
        ? carbohydrates.value
        : this.carbohydrates,
    fiber: fiber.present ? fiber.value : this.fiber,
  );
  NutritionRow copyWithCompanion(NutritionFactsCompanion data) {
    return NutritionRow(
      id: data.id.present ? data.id.value : this.id,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      calories: data.calories.present ? data.calories.value : this.calories,
      proteins: data.proteins.present ? data.proteins.value : this.proteins,
      carbohydrates: data.carbohydrates.present
          ? data.carbohydrates.value
          : this.carbohydrates,
      fiber: data.fiber.present ? data.fiber.value : this.fiber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NutritionRow(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('calories: $calories, ')
          ..write('proteins: $proteins, ')
          ..write('carbohydrates: $carbohydrates, ')
          ..write('fiber: $fiber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, recipeId, calories, proteins, carbohydrates, fiber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NutritionRow &&
          other.id == this.id &&
          other.recipeId == this.recipeId &&
          other.calories == this.calories &&
          other.proteins == this.proteins &&
          other.carbohydrates == this.carbohydrates &&
          other.fiber == this.fiber);
}

class NutritionFactsCompanion extends UpdateCompanion<NutritionRow> {
  final Value<String> id;
  final Value<String> recipeId;
  final Value<int?> calories;
  final Value<double?> proteins;
  final Value<double?> carbohydrates;
  final Value<double?> fiber;
  final Value<int> rowid;
  const NutritionFactsCompanion({
    this.id = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.calories = const Value.absent(),
    this.proteins = const Value.absent(),
    this.carbohydrates = const Value.absent(),
    this.fiber = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NutritionFactsCompanion.insert({
    required String id,
    required String recipeId,
    this.calories = const Value.absent(),
    this.proteins = const Value.absent(),
    this.carbohydrates = const Value.absent(),
    this.fiber = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       recipeId = Value(recipeId);
  static Insertable<NutritionRow> custom({
    Expression<String>? id,
    Expression<String>? recipeId,
    Expression<int>? calories,
    Expression<double>? proteins,
    Expression<double>? carbohydrates,
    Expression<double>? fiber,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipeId != null) 'recipe_id': recipeId,
      if (calories != null) 'calories': calories,
      if (proteins != null) 'proteins': proteins,
      if (carbohydrates != null) 'carbohydrates': carbohydrates,
      if (fiber != null) 'fiber': fiber,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NutritionFactsCompanion copyWith({
    Value<String>? id,
    Value<String>? recipeId,
    Value<int?>? calories,
    Value<double?>? proteins,
    Value<double?>? carbohydrates,
    Value<double?>? fiber,
    Value<int>? rowid,
  }) {
    return NutritionFactsCompanion(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      calories: calories ?? this.calories,
      proteins: proteins ?? this.proteins,
      carbohydrates: carbohydrates ?? this.carbohydrates,
      fiber: fiber ?? this.fiber,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (calories.present) {
      map['calories'] = Variable<int>(calories.value);
    }
    if (proteins.present) {
      map['proteins'] = Variable<double>(proteins.value);
    }
    if (carbohydrates.present) {
      map['carbohydrates'] = Variable<double>(carbohydrates.value);
    }
    if (fiber.present) {
      map['fiber'] = Variable<double>(fiber.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NutritionFactsCompanion(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('calories: $calories, ')
          ..write('proteins: $proteins, ')
          ..write('carbohydrates: $carbohydrates, ')
          ..write('fiber: $fiber, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $DietaryCatalogTable dietaryCatalog = $DietaryCatalogTable(this);
  late final $RecipesTable recipes = $RecipesTable(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  late final $UserDietaryPrefsTable userDietaryPrefs = $UserDietaryPrefsTable(
    this,
  );
  late final $RecipeDietaryJunctionTable recipeDietaryJunction =
      $RecipeDietaryJunctionTable(this);
  late final $NutritionFactsTable nutritionFacts = $NutritionFactsTable(this);
  late final UsersDao usersDao = UsersDao(this as AppDatabase);
  late final RecipesDao recipesDao = RecipesDao(this as AppDatabase);
  late final FavoritesDao favoritesDao = FavoritesDao(this as AppDatabase);
  late final DietaryDao dietaryDao = DietaryDao(this as AppDatabase);
  late final NutritionDao nutritionDao = NutritionDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    dietaryCatalog,
    recipes,
    favorites,
    userDietaryPrefs,
    recipeDietaryJunction,
    nutritionFacts,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String id,
      required String userHash,
      required String username,
      required String email,
      required String passwordHash,
      Value<DateTime?> createdAt,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> id,
      Value<String> userHash,
      Value<String> username,
      Value<String> email,
      Value<String> passwordHash,
      Value<DateTime?> createdAt,
      Value<int> rowid,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, UserRow> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecipesTable, List<RecipeRow>> _recipesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.recipes,
    aliasName: $_aliasNameGenerator(db.users.id, db.recipes.userId),
  );

  $$RecipesTableProcessedTableManager get recipesRefs {
    final manager = $$RecipesTableTableManager(
      $_db,
      $_db.recipes,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_recipesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$FavoritesTable, List<FavoriteRow>>
  _favoritesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.favorites,
    aliasName: $_aliasNameGenerator(db.users.id, db.favorites.userId),
  );

  $$FavoritesTableProcessedTableManager get favoritesRefs {
    final manager = $$FavoritesTableTableManager(
      $_db,
      $_db.favorites,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_favoritesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UserDietaryPrefsTable, List<UserDietaryPref>>
  _userDietaryPrefsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userDietaryPrefs,
    aliasName: $_aliasNameGenerator(db.users.id, db.userDietaryPrefs.userId),
  );

  $$UserDietaryPrefsTableProcessedTableManager get userDietaryPrefsRefs {
    final manager = $$UserDietaryPrefsTableTableManager(
      $_db,
      $_db.userDietaryPrefs,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _userDietaryPrefsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
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

  ColumnFilters<String> get userHash => $composableBuilder(
    column: $table.userHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> recipesRefs(
    Expression<bool> Function($$RecipesTableFilterComposer f) f,
  ) {
    final $$RecipesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableFilterComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> favoritesRefs(
    Expression<bool> Function($$FavoritesTableFilterComposer f) f,
  ) {
    final $$FavoritesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favorites,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavoritesTableFilterComposer(
            $db: $db,
            $table: $db.favorites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> userDietaryPrefsRefs(
    Expression<bool> Function($$UserDietaryPrefsTableFilterComposer f) f,
  ) {
    final $$UserDietaryPrefsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userDietaryPrefs,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserDietaryPrefsTableFilterComposer(
            $db: $db,
            $table: $db.userDietaryPrefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
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

  ColumnOrderings<String> get userHash => $composableBuilder(
    column: $table.userHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userHash =>
      $composableBuilder(column: $table.userHash, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> recipesRefs<T extends Object>(
    Expression<T> Function($$RecipesTableAnnotationComposer a) f,
  ) {
    final $$RecipesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableAnnotationComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> favoritesRefs<T extends Object>(
    Expression<T> Function($$FavoritesTableAnnotationComposer a) f,
  ) {
    final $$FavoritesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favorites,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavoritesTableAnnotationComposer(
            $db: $db,
            $table: $db.favorites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> userDietaryPrefsRefs<T extends Object>(
    Expression<T> Function($$UserDietaryPrefsTableAnnotationComposer a) f,
  ) {
    final $$UserDietaryPrefsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userDietaryPrefs,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserDietaryPrefsTableAnnotationComposer(
            $db: $db,
            $table: $db.userDietaryPrefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          UserRow,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (UserRow, $$UsersTableReferences),
          UserRow,
          PrefetchHooks Function({
            bool recipesRefs,
            bool favoritesRefs,
            bool userDietaryPrefsRefs,
          })
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userHash = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> passwordHash = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                userHash: userHash,
                username: username,
                email: email,
                passwordHash: passwordHash,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userHash,
                required String username,
                required String email,
                required String passwordHash,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                userHash: userHash,
                username: username,
                email: email,
                passwordHash: passwordHash,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                recipesRefs = false,
                favoritesRefs = false,
                userDietaryPrefsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (recipesRefs) db.recipes,
                    if (favoritesRefs) db.favorites,
                    if (userDietaryPrefsRefs) db.userDietaryPrefs,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (recipesRefs)
                        await $_getPrefetchedData<
                          UserRow,
                          $UsersTable,
                          RecipeRow
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._recipesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(db, table, p0).recipesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (favoritesRefs)
                        await $_getPrefetchedData<
                          UserRow,
                          $UsersTable,
                          FavoriteRow
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._favoritesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).favoritesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (userDietaryPrefsRefs)
                        await $_getPrefetchedData<
                          UserRow,
                          $UsersTable,
                          UserDietaryPref
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._userDietaryPrefsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).userDietaryPrefsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      UserRow,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (UserRow, $$UsersTableReferences),
      UserRow,
      PrefetchHooks Function({
        bool recipesRefs,
        bool favoritesRefs,
        bool userDietaryPrefsRefs,
      })
    >;
typedef $$DietaryCatalogTableCreateCompanionBuilder =
    DietaryCatalogCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      Value<int> rowid,
    });
typedef $$DietaryCatalogTableUpdateCompanionBuilder =
    DietaryCatalogCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<int> rowid,
    });

final class $$DietaryCatalogTableReferences
    extends
        BaseReferences<_$AppDatabase, $DietaryCatalogTable, DietaryOptionRow> {
  $$DietaryCatalogTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$UserDietaryPrefsTable, List<UserDietaryPref>>
  _userDietaryPrefsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userDietaryPrefs,
    aliasName: $_aliasNameGenerator(
      db.dietaryCatalog.id,
      db.userDietaryPrefs.dietaryOptionId,
    ),
  );

  $$UserDietaryPrefsTableProcessedTableManager get userDietaryPrefsRefs {
    final manager =
        $$UserDietaryPrefsTableTableManager($_db, $_db.userDietaryPrefs).filter(
          (f) => f.dietaryOptionId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _userDietaryPrefsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RecipeDietaryJunctionTable,
    List<RecipeDietaryJunctionData>
  >
  _recipeDietaryJunctionRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recipeDietaryJunction,
        aliasName: $_aliasNameGenerator(
          db.dietaryCatalog.id,
          db.recipeDietaryJunction.dietaryOptionId,
        ),
      );

  $$RecipeDietaryJunctionTableProcessedTableManager
  get recipeDietaryJunctionRefs {
    final manager =
        $$RecipeDietaryJunctionTableTableManager(
          $_db,
          $_db.recipeDietaryJunction,
        ).filter(
          (f) => f.dietaryOptionId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _recipeDietaryJunctionRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DietaryCatalogTableFilterComposer
    extends Composer<_$AppDatabase, $DietaryCatalogTable> {
  $$DietaryCatalogTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> userDietaryPrefsRefs(
    Expression<bool> Function($$UserDietaryPrefsTableFilterComposer f) f,
  ) {
    final $$UserDietaryPrefsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userDietaryPrefs,
      getReferencedColumn: (t) => t.dietaryOptionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserDietaryPrefsTableFilterComposer(
            $db: $db,
            $table: $db.userDietaryPrefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> recipeDietaryJunctionRefs(
    Expression<bool> Function($$RecipeDietaryJunctionTableFilterComposer f) f,
  ) {
    final $$RecipeDietaryJunctionTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeDietaryJunction,
          getReferencedColumn: (t) => t.dietaryOptionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeDietaryJunctionTableFilterComposer(
                $db: $db,
                $table: $db.recipeDietaryJunction,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$DietaryCatalogTableOrderingComposer
    extends Composer<_$AppDatabase, $DietaryCatalogTable> {
  $$DietaryCatalogTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DietaryCatalogTableAnnotationComposer
    extends Composer<_$AppDatabase, $DietaryCatalogTable> {
  $$DietaryCatalogTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  Expression<T> userDietaryPrefsRefs<T extends Object>(
    Expression<T> Function($$UserDietaryPrefsTableAnnotationComposer a) f,
  ) {
    final $$UserDietaryPrefsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userDietaryPrefs,
      getReferencedColumn: (t) => t.dietaryOptionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserDietaryPrefsTableAnnotationComposer(
            $db: $db,
            $table: $db.userDietaryPrefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> recipeDietaryJunctionRefs<T extends Object>(
    Expression<T> Function($$RecipeDietaryJunctionTableAnnotationComposer a) f,
  ) {
    final $$RecipeDietaryJunctionTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeDietaryJunction,
          getReferencedColumn: (t) => t.dietaryOptionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeDietaryJunctionTableAnnotationComposer(
                $db: $db,
                $table: $db.recipeDietaryJunction,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$DietaryCatalogTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DietaryCatalogTable,
          DietaryOptionRow,
          $$DietaryCatalogTableFilterComposer,
          $$DietaryCatalogTableOrderingComposer,
          $$DietaryCatalogTableAnnotationComposer,
          $$DietaryCatalogTableCreateCompanionBuilder,
          $$DietaryCatalogTableUpdateCompanionBuilder,
          (DietaryOptionRow, $$DietaryCatalogTableReferences),
          DietaryOptionRow,
          PrefetchHooks Function({
            bool userDietaryPrefsRefs,
            bool recipeDietaryJunctionRefs,
          })
        > {
  $$DietaryCatalogTableTableManager(
    _$AppDatabase db,
    $DietaryCatalogTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DietaryCatalogTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DietaryCatalogTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DietaryCatalogTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DietaryCatalogCompanion(
                id: id,
                name: name,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DietaryCatalogCompanion.insert(
                id: id,
                name: name,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DietaryCatalogTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userDietaryPrefsRefs = false,
                recipeDietaryJunctionRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (userDietaryPrefsRefs) db.userDietaryPrefs,
                    if (recipeDietaryJunctionRefs) db.recipeDietaryJunction,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (userDietaryPrefsRefs)
                        await $_getPrefetchedData<
                          DietaryOptionRow,
                          $DietaryCatalogTable,
                          UserDietaryPref
                        >(
                          currentTable: table,
                          referencedTable: $$DietaryCatalogTableReferences
                              ._userDietaryPrefsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DietaryCatalogTableReferences(
                                db,
                                table,
                                p0,
                              ).userDietaryPrefsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.dietaryOptionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (recipeDietaryJunctionRefs)
                        await $_getPrefetchedData<
                          DietaryOptionRow,
                          $DietaryCatalogTable,
                          RecipeDietaryJunctionData
                        >(
                          currentTable: table,
                          referencedTable: $$DietaryCatalogTableReferences
                              ._recipeDietaryJunctionRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DietaryCatalogTableReferences(
                                db,
                                table,
                                p0,
                              ).recipeDietaryJunctionRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.dietaryOptionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DietaryCatalogTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DietaryCatalogTable,
      DietaryOptionRow,
      $$DietaryCatalogTableFilterComposer,
      $$DietaryCatalogTableOrderingComposer,
      $$DietaryCatalogTableAnnotationComposer,
      $$DietaryCatalogTableCreateCompanionBuilder,
      $$DietaryCatalogTableUpdateCompanionBuilder,
      (DietaryOptionRow, $$DietaryCatalogTableReferences),
      DietaryOptionRow,
      PrefetchHooks Function({
        bool userDietaryPrefsRefs,
        bool recipeDietaryJunctionRefs,
      })
    >;
typedef $$RecipesTableCreateCompanionBuilder =
    RecipesCompanion Function({
      required String id,
      required String userId,
      required String title,
      Value<String?> description,
      Value<String?> ingredients,
      Value<String?> instructions,
      Value<int?> prepTime,
      Value<int?> cookTime,
      Value<int?> servings,
      Value<String?> difficulty,
      Value<String?> imageUrl,
      Value<int> rowid,
    });
typedef $$RecipesTableUpdateCompanionBuilder =
    RecipesCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> title,
      Value<String?> description,
      Value<String?> ingredients,
      Value<String?> instructions,
      Value<int?> prepTime,
      Value<int?> cookTime,
      Value<int?> servings,
      Value<String?> difficulty,
      Value<String?> imageUrl,
      Value<int> rowid,
    });

final class $$RecipesTableReferences
    extends BaseReferences<_$AppDatabase, $RecipesTable, RecipeRow> {
  $$RecipesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.recipes.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$FavoritesTable, List<FavoriteRow>>
  _favoritesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.favorites,
    aliasName: $_aliasNameGenerator(db.recipes.id, db.favorites.recipeId),
  );

  $$FavoritesTableProcessedTableManager get favoritesRefs {
    final manager = $$FavoritesTableTableManager(
      $_db,
      $_db.favorites,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_favoritesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RecipeDietaryJunctionTable,
    List<RecipeDietaryJunctionData>
  >
  _recipeDietaryJunctionRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recipeDietaryJunction,
        aliasName: $_aliasNameGenerator(
          db.recipes.id,
          db.recipeDietaryJunction.recipeId,
        ),
      );

  $$RecipeDietaryJunctionTableProcessedTableManager
  get recipeDietaryJunctionRefs {
    final manager = $$RecipeDietaryJunctionTableTableManager(
      $_db,
      $_db.recipeDietaryJunction,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recipeDietaryJunctionRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$NutritionFactsTable, List<NutritionRow>>
  _nutritionFactsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.nutritionFacts,
    aliasName: $_aliasNameGenerator(db.recipes.id, db.nutritionFacts.recipeId),
  );

  $$NutritionFactsTableProcessedTableManager get nutritionFactsRefs {
    final manager = $$NutritionFactsTableTableManager(
      $_db,
      $_db.nutritionFacts,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_nutritionFactsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RecipesTableFilterComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableFilterComposer({
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

  ColumnFilters<int> get prepTime => $composableBuilder(
    column: $table.prepTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cookTime => $composableBuilder(
    column: $table.cookTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get servings => $composableBuilder(
    column: $table.servings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> favoritesRefs(
    Expression<bool> Function($$FavoritesTableFilterComposer f) f,
  ) {
    final $$FavoritesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favorites,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavoritesTableFilterComposer(
            $db: $db,
            $table: $db.favorites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> recipeDietaryJunctionRefs(
    Expression<bool> Function($$RecipeDietaryJunctionTableFilterComposer f) f,
  ) {
    final $$RecipeDietaryJunctionTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeDietaryJunction,
          getReferencedColumn: (t) => t.recipeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeDietaryJunctionTableFilterComposer(
                $db: $db,
                $table: $db.recipeDietaryJunction,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> nutritionFactsRefs(
    Expression<bool> Function($$NutritionFactsTableFilterComposer f) f,
  ) {
    final $$NutritionFactsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.nutritionFacts,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NutritionFactsTableFilterComposer(
            $db: $db,
            $table: $db.nutritionFacts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecipesTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableOrderingComposer({
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

  ColumnOrderings<int> get prepTime => $composableBuilder(
    column: $table.prepTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cookTime => $composableBuilder(
    column: $table.cookTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get servings => $composableBuilder(
    column: $table.servings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
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

  GeneratedColumn<int> get prepTime =>
      $composableBuilder(column: $table.prepTime, builder: (column) => column);

  GeneratedColumn<int> get cookTime =>
      $composableBuilder(column: $table.cookTime, builder: (column) => column);

  GeneratedColumn<int> get servings =>
      $composableBuilder(column: $table.servings, builder: (column) => column);

  GeneratedColumn<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> favoritesRefs<T extends Object>(
    Expression<T> Function($$FavoritesTableAnnotationComposer a) f,
  ) {
    final $$FavoritesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favorites,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavoritesTableAnnotationComposer(
            $db: $db,
            $table: $db.favorites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> recipeDietaryJunctionRefs<T extends Object>(
    Expression<T> Function($$RecipeDietaryJunctionTableAnnotationComposer a) f,
  ) {
    final $$RecipeDietaryJunctionTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeDietaryJunction,
          getReferencedColumn: (t) => t.recipeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeDietaryJunctionTableAnnotationComposer(
                $db: $db,
                $table: $db.recipeDietaryJunction,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> nutritionFactsRefs<T extends Object>(
    Expression<T> Function($$NutritionFactsTableAnnotationComposer a) f,
  ) {
    final $$NutritionFactsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.nutritionFacts,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NutritionFactsTableAnnotationComposer(
            $db: $db,
            $table: $db.nutritionFacts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecipesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipesTable,
          RecipeRow,
          $$RecipesTableFilterComposer,
          $$RecipesTableOrderingComposer,
          $$RecipesTableAnnotationComposer,
          $$RecipesTableCreateCompanionBuilder,
          $$RecipesTableUpdateCompanionBuilder,
          (RecipeRow, $$RecipesTableReferences),
          RecipeRow,
          PrefetchHooks Function({
            bool userId,
            bool favoritesRefs,
            bool recipeDietaryJunctionRefs,
            bool nutritionFactsRefs,
          })
        > {
  $$RecipesTableTableManager(_$AppDatabase db, $RecipesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> ingredients = const Value.absent(),
                Value<String?> instructions = const Value.absent(),
                Value<int?> prepTime = const Value.absent(),
                Value<int?> cookTime = const Value.absent(),
                Value<int?> servings = const Value.absent(),
                Value<String?> difficulty = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipesCompanion(
                id: id,
                userId: userId,
                title: title,
                description: description,
                ingredients: ingredients,
                instructions: instructions,
                prepTime: prepTime,
                cookTime: cookTime,
                servings: servings,
                difficulty: difficulty,
                imageUrl: imageUrl,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String title,
                Value<String?> description = const Value.absent(),
                Value<String?> ingredients = const Value.absent(),
                Value<String?> instructions = const Value.absent(),
                Value<int?> prepTime = const Value.absent(),
                Value<int?> cookTime = const Value.absent(),
                Value<int?> servings = const Value.absent(),
                Value<String?> difficulty = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipesCompanion.insert(
                id: id,
                userId: userId,
                title: title,
                description: description,
                ingredients: ingredients,
                instructions: instructions,
                prepTime: prepTime,
                cookTime: cookTime,
                servings: servings,
                difficulty: difficulty,
                imageUrl: imageUrl,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecipesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userId = false,
                favoritesRefs = false,
                recipeDietaryJunctionRefs = false,
                nutritionFactsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (favoritesRefs) db.favorites,
                    if (recipeDietaryJunctionRefs) db.recipeDietaryJunction,
                    if (nutritionFactsRefs) db.nutritionFacts,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable: $$RecipesTableReferences
                                        ._userIdTable(db),
                                    referencedColumn: $$RecipesTableReferences
                                        ._userIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (favoritesRefs)
                        await $_getPrefetchedData<
                          RecipeRow,
                          $RecipesTable,
                          FavoriteRow
                        >(
                          currentTable: table,
                          referencedTable: $$RecipesTableReferences
                              ._favoritesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipesTableReferences(
                                db,
                                table,
                                p0,
                              ).favoritesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (recipeDietaryJunctionRefs)
                        await $_getPrefetchedData<
                          RecipeRow,
                          $RecipesTable,
                          RecipeDietaryJunctionData
                        >(
                          currentTable: table,
                          referencedTable: $$RecipesTableReferences
                              ._recipeDietaryJunctionRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipesTableReferences(
                                db,
                                table,
                                p0,
                              ).recipeDietaryJunctionRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (nutritionFactsRefs)
                        await $_getPrefetchedData<
                          RecipeRow,
                          $RecipesTable,
                          NutritionRow
                        >(
                          currentTable: table,
                          referencedTable: $$RecipesTableReferences
                              ._nutritionFactsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipesTableReferences(
                                db,
                                table,
                                p0,
                              ).nutritionFactsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RecipesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipesTable,
      RecipeRow,
      $$RecipesTableFilterComposer,
      $$RecipesTableOrderingComposer,
      $$RecipesTableAnnotationComposer,
      $$RecipesTableCreateCompanionBuilder,
      $$RecipesTableUpdateCompanionBuilder,
      (RecipeRow, $$RecipesTableReferences),
      RecipeRow,
      PrefetchHooks Function({
        bool userId,
        bool favoritesRefs,
        bool recipeDietaryJunctionRefs,
        bool nutritionFactsRefs,
      })
    >;
typedef $$FavoritesTableCreateCompanionBuilder =
    FavoritesCompanion Function({
      required String id,
      required String userId,
      required String recipeId,
      Value<DateTime?> createdAt,
      Value<int> rowid,
    });
typedef $$FavoritesTableUpdateCompanionBuilder =
    FavoritesCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> recipeId,
      Value<DateTime?> createdAt,
      Value<int> rowid,
    });

final class $$FavoritesTableReferences
    extends BaseReferences<_$AppDatabase, $FavoritesTable, FavoriteRow> {
  $$FavoritesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.favorites.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RecipesTable _recipeIdTable(_$AppDatabase db) => db.recipes
      .createAlias($_aliasNameGenerator(db.favorites.recipeId, db.recipes.id));

  $$RecipesTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<String>('recipe_id')!;

    final manager = $$RecipesTableTableManager(
      $_db,
      $_db.recipes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FavoritesTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableFilterComposer({
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipesTableFilterComposer get recipeId {
    final $$RecipesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableFilterComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoritesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableOrderingComposer({
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipesTableOrderingComposer get recipeId {
    final $$RecipesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableOrderingComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoritesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipesTableAnnotationComposer get recipeId {
    final $$RecipesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableAnnotationComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoritesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoritesTable,
          FavoriteRow,
          $$FavoritesTableFilterComposer,
          $$FavoritesTableOrderingComposer,
          $$FavoritesTableAnnotationComposer,
          $$FavoritesTableCreateCompanionBuilder,
          $$FavoritesTableUpdateCompanionBuilder,
          (FavoriteRow, $$FavoritesTableReferences),
          FavoriteRow,
          PrefetchHooks Function({bool userId, bool recipeId})
        > {
  $$FavoritesTableTableManager(_$AppDatabase db, $FavoritesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> recipeId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoritesCompanion(
                id: id,
                userId: userId,
                recipeId: recipeId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String recipeId,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoritesCompanion.insert(
                id: id,
                userId: userId,
                recipeId: recipeId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FavoritesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false, recipeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$FavoritesTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$FavoritesTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (recipeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.recipeId,
                                referencedTable: $$FavoritesTableReferences
                                    ._recipeIdTable(db),
                                referencedColumn: $$FavoritesTableReferences
                                    ._recipeIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FavoritesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoritesTable,
      FavoriteRow,
      $$FavoritesTableFilterComposer,
      $$FavoritesTableOrderingComposer,
      $$FavoritesTableAnnotationComposer,
      $$FavoritesTableCreateCompanionBuilder,
      $$FavoritesTableUpdateCompanionBuilder,
      (FavoriteRow, $$FavoritesTableReferences),
      FavoriteRow,
      PrefetchHooks Function({bool userId, bool recipeId})
    >;
typedef $$UserDietaryPrefsTableCreateCompanionBuilder =
    UserDietaryPrefsCompanion Function({
      required String userId,
      required String dietaryOptionId,
      Value<int> rowid,
    });
typedef $$UserDietaryPrefsTableUpdateCompanionBuilder =
    UserDietaryPrefsCompanion Function({
      Value<String> userId,
      Value<String> dietaryOptionId,
      Value<int> rowid,
    });

final class $$UserDietaryPrefsTableReferences
    extends
        BaseReferences<_$AppDatabase, $UserDietaryPrefsTable, UserDietaryPref> {
  $$UserDietaryPrefsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.userDietaryPrefs.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DietaryCatalogTable _dietaryOptionIdTable(_$AppDatabase db) =>
      db.dietaryCatalog.createAlias(
        $_aliasNameGenerator(
          db.userDietaryPrefs.dietaryOptionId,
          db.dietaryCatalog.id,
        ),
      );

  $$DietaryCatalogTableProcessedTableManager get dietaryOptionId {
    final $_column = $_itemColumn<String>('dietary_option_id')!;

    final manager = $$DietaryCatalogTableTableManager(
      $_db,
      $_db.dietaryCatalog,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dietaryOptionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserDietaryPrefsTableFilterComposer
    extends Composer<_$AppDatabase, $UserDietaryPrefsTable> {
  $$UserDietaryPrefsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DietaryCatalogTableFilterComposer get dietaryOptionId {
    final $$DietaryCatalogTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dietaryOptionId,
      referencedTable: $db.dietaryCatalog,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DietaryCatalogTableFilterComposer(
            $db: $db,
            $table: $db.dietaryCatalog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserDietaryPrefsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserDietaryPrefsTable> {
  $$UserDietaryPrefsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DietaryCatalogTableOrderingComposer get dietaryOptionId {
    final $$DietaryCatalogTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dietaryOptionId,
      referencedTable: $db.dietaryCatalog,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DietaryCatalogTableOrderingComposer(
            $db: $db,
            $table: $db.dietaryCatalog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserDietaryPrefsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserDietaryPrefsTable> {
  $$UserDietaryPrefsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DietaryCatalogTableAnnotationComposer get dietaryOptionId {
    final $$DietaryCatalogTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dietaryOptionId,
      referencedTable: $db.dietaryCatalog,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DietaryCatalogTableAnnotationComposer(
            $db: $db,
            $table: $db.dietaryCatalog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserDietaryPrefsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserDietaryPrefsTable,
          UserDietaryPref,
          $$UserDietaryPrefsTableFilterComposer,
          $$UserDietaryPrefsTableOrderingComposer,
          $$UserDietaryPrefsTableAnnotationComposer,
          $$UserDietaryPrefsTableCreateCompanionBuilder,
          $$UserDietaryPrefsTableUpdateCompanionBuilder,
          (UserDietaryPref, $$UserDietaryPrefsTableReferences),
          UserDietaryPref,
          PrefetchHooks Function({bool userId, bool dietaryOptionId})
        > {
  $$UserDietaryPrefsTableTableManager(
    _$AppDatabase db,
    $UserDietaryPrefsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserDietaryPrefsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserDietaryPrefsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserDietaryPrefsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> userId = const Value.absent(),
                Value<String> dietaryOptionId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserDietaryPrefsCompanion(
                userId: userId,
                dietaryOptionId: dietaryOptionId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userId,
                required String dietaryOptionId,
                Value<int> rowid = const Value.absent(),
              }) => UserDietaryPrefsCompanion.insert(
                userId: userId,
                dietaryOptionId: dietaryOptionId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserDietaryPrefsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false, dietaryOptionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable:
                                    $$UserDietaryPrefsTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$UserDietaryPrefsTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (dietaryOptionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.dietaryOptionId,
                                referencedTable:
                                    $$UserDietaryPrefsTableReferences
                                        ._dietaryOptionIdTable(db),
                                referencedColumn:
                                    $$UserDietaryPrefsTableReferences
                                        ._dietaryOptionIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UserDietaryPrefsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserDietaryPrefsTable,
      UserDietaryPref,
      $$UserDietaryPrefsTableFilterComposer,
      $$UserDietaryPrefsTableOrderingComposer,
      $$UserDietaryPrefsTableAnnotationComposer,
      $$UserDietaryPrefsTableCreateCompanionBuilder,
      $$UserDietaryPrefsTableUpdateCompanionBuilder,
      (UserDietaryPref, $$UserDietaryPrefsTableReferences),
      UserDietaryPref,
      PrefetchHooks Function({bool userId, bool dietaryOptionId})
    >;
typedef $$RecipeDietaryJunctionTableCreateCompanionBuilder =
    RecipeDietaryJunctionCompanion Function({
      required String recipeId,
      required String dietaryOptionId,
      Value<int> rowid,
    });
typedef $$RecipeDietaryJunctionTableUpdateCompanionBuilder =
    RecipeDietaryJunctionCompanion Function({
      Value<String> recipeId,
      Value<String> dietaryOptionId,
      Value<int> rowid,
    });

final class $$RecipeDietaryJunctionTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RecipeDietaryJunctionTable,
          RecipeDietaryJunctionData
        > {
  $$RecipeDietaryJunctionTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecipesTable _recipeIdTable(_$AppDatabase db) =>
      db.recipes.createAlias(
        $_aliasNameGenerator(db.recipeDietaryJunction.recipeId, db.recipes.id),
      );

  $$RecipesTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<String>('recipe_id')!;

    final manager = $$RecipesTableTableManager(
      $_db,
      $_db.recipes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DietaryCatalogTable _dietaryOptionIdTable(_$AppDatabase db) =>
      db.dietaryCatalog.createAlias(
        $_aliasNameGenerator(
          db.recipeDietaryJunction.dietaryOptionId,
          db.dietaryCatalog.id,
        ),
      );

  $$DietaryCatalogTableProcessedTableManager get dietaryOptionId {
    final $_column = $_itemColumn<String>('dietary_option_id')!;

    final manager = $$DietaryCatalogTableTableManager(
      $_db,
      $_db.dietaryCatalog,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dietaryOptionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RecipeDietaryJunctionTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeDietaryJunctionTable> {
  $$RecipeDietaryJunctionTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$RecipesTableFilterComposer get recipeId {
    final $$RecipesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableFilterComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DietaryCatalogTableFilterComposer get dietaryOptionId {
    final $$DietaryCatalogTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dietaryOptionId,
      referencedTable: $db.dietaryCatalog,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DietaryCatalogTableFilterComposer(
            $db: $db,
            $table: $db.dietaryCatalog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeDietaryJunctionTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeDietaryJunctionTable> {
  $$RecipeDietaryJunctionTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$RecipesTableOrderingComposer get recipeId {
    final $$RecipesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableOrderingComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DietaryCatalogTableOrderingComposer get dietaryOptionId {
    final $$DietaryCatalogTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dietaryOptionId,
      referencedTable: $db.dietaryCatalog,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DietaryCatalogTableOrderingComposer(
            $db: $db,
            $table: $db.dietaryCatalog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeDietaryJunctionTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeDietaryJunctionTable> {
  $$RecipeDietaryJunctionTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$RecipesTableAnnotationComposer get recipeId {
    final $$RecipesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableAnnotationComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DietaryCatalogTableAnnotationComposer get dietaryOptionId {
    final $$DietaryCatalogTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dietaryOptionId,
      referencedTable: $db.dietaryCatalog,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DietaryCatalogTableAnnotationComposer(
            $db: $db,
            $table: $db.dietaryCatalog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeDietaryJunctionTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeDietaryJunctionTable,
          RecipeDietaryJunctionData,
          $$RecipeDietaryJunctionTableFilterComposer,
          $$RecipeDietaryJunctionTableOrderingComposer,
          $$RecipeDietaryJunctionTableAnnotationComposer,
          $$RecipeDietaryJunctionTableCreateCompanionBuilder,
          $$RecipeDietaryJunctionTableUpdateCompanionBuilder,
          (RecipeDietaryJunctionData, $$RecipeDietaryJunctionTableReferences),
          RecipeDietaryJunctionData,
          PrefetchHooks Function({bool recipeId, bool dietaryOptionId})
        > {
  $$RecipeDietaryJunctionTableTableManager(
    _$AppDatabase db,
    $RecipeDietaryJunctionTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeDietaryJunctionTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$RecipeDietaryJunctionTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RecipeDietaryJunctionTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> recipeId = const Value.absent(),
                Value<String> dietaryOptionId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipeDietaryJunctionCompanion(
                recipeId: recipeId,
                dietaryOptionId: dietaryOptionId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String recipeId,
                required String dietaryOptionId,
                Value<int> rowid = const Value.absent(),
              }) => RecipeDietaryJunctionCompanion.insert(
                recipeId: recipeId,
                dietaryOptionId: dietaryOptionId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecipeDietaryJunctionTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recipeId = false, dietaryOptionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (recipeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.recipeId,
                                referencedTable:
                                    $$RecipeDietaryJunctionTableReferences
                                        ._recipeIdTable(db),
                                referencedColumn:
                                    $$RecipeDietaryJunctionTableReferences
                                        ._recipeIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (dietaryOptionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.dietaryOptionId,
                                referencedTable:
                                    $$RecipeDietaryJunctionTableReferences
                                        ._dietaryOptionIdTable(db),
                                referencedColumn:
                                    $$RecipeDietaryJunctionTableReferences
                                        ._dietaryOptionIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RecipeDietaryJunctionTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeDietaryJunctionTable,
      RecipeDietaryJunctionData,
      $$RecipeDietaryJunctionTableFilterComposer,
      $$RecipeDietaryJunctionTableOrderingComposer,
      $$RecipeDietaryJunctionTableAnnotationComposer,
      $$RecipeDietaryJunctionTableCreateCompanionBuilder,
      $$RecipeDietaryJunctionTableUpdateCompanionBuilder,
      (RecipeDietaryJunctionData, $$RecipeDietaryJunctionTableReferences),
      RecipeDietaryJunctionData,
      PrefetchHooks Function({bool recipeId, bool dietaryOptionId})
    >;
typedef $$NutritionFactsTableCreateCompanionBuilder =
    NutritionFactsCompanion Function({
      required String id,
      required String recipeId,
      Value<int?> calories,
      Value<double?> proteins,
      Value<double?> carbohydrates,
      Value<double?> fiber,
      Value<int> rowid,
    });
typedef $$NutritionFactsTableUpdateCompanionBuilder =
    NutritionFactsCompanion Function({
      Value<String> id,
      Value<String> recipeId,
      Value<int?> calories,
      Value<double?> proteins,
      Value<double?> carbohydrates,
      Value<double?> fiber,
      Value<int> rowid,
    });

final class $$NutritionFactsTableReferences
    extends BaseReferences<_$AppDatabase, $NutritionFactsTable, NutritionRow> {
  $$NutritionFactsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecipesTable _recipeIdTable(_$AppDatabase db) =>
      db.recipes.createAlias(
        $_aliasNameGenerator(db.nutritionFacts.recipeId, db.recipes.id),
      );

  $$RecipesTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<String>('recipe_id')!;

    final manager = $$RecipesTableTableManager(
      $_db,
      $_db.recipes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NutritionFactsTableFilterComposer
    extends Composer<_$AppDatabase, $NutritionFactsTable> {
  $$NutritionFactsTableFilterComposer({
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

  ColumnFilters<int> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get proteins => $composableBuilder(
    column: $table.proteins,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get carbohydrates => $composableBuilder(
    column: $table.carbohydrates,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fiber => $composableBuilder(
    column: $table.fiber,
    builder: (column) => ColumnFilters(column),
  );

  $$RecipesTableFilterComposer get recipeId {
    final $$RecipesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableFilterComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NutritionFactsTableOrderingComposer
    extends Composer<_$AppDatabase, $NutritionFactsTable> {
  $$NutritionFactsTableOrderingComposer({
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

  ColumnOrderings<int> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get proteins => $composableBuilder(
    column: $table.proteins,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get carbohydrates => $composableBuilder(
    column: $table.carbohydrates,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fiber => $composableBuilder(
    column: $table.fiber,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecipesTableOrderingComposer get recipeId {
    final $$RecipesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableOrderingComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NutritionFactsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NutritionFactsTable> {
  $$NutritionFactsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

  GeneratedColumn<double> get proteins =>
      $composableBuilder(column: $table.proteins, builder: (column) => column);

  GeneratedColumn<double> get carbohydrates => $composableBuilder(
    column: $table.carbohydrates,
    builder: (column) => column,
  );

  GeneratedColumn<double> get fiber =>
      $composableBuilder(column: $table.fiber, builder: (column) => column);

  $$RecipesTableAnnotationComposer get recipeId {
    final $$RecipesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipesTableAnnotationComposer(
            $db: $db,
            $table: $db.recipes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NutritionFactsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NutritionFactsTable,
          NutritionRow,
          $$NutritionFactsTableFilterComposer,
          $$NutritionFactsTableOrderingComposer,
          $$NutritionFactsTableAnnotationComposer,
          $$NutritionFactsTableCreateCompanionBuilder,
          $$NutritionFactsTableUpdateCompanionBuilder,
          (NutritionRow, $$NutritionFactsTableReferences),
          NutritionRow,
          PrefetchHooks Function({bool recipeId})
        > {
  $$NutritionFactsTableTableManager(
    _$AppDatabase db,
    $NutritionFactsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NutritionFactsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NutritionFactsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NutritionFactsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> recipeId = const Value.absent(),
                Value<int?> calories = const Value.absent(),
                Value<double?> proteins = const Value.absent(),
                Value<double?> carbohydrates = const Value.absent(),
                Value<double?> fiber = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NutritionFactsCompanion(
                id: id,
                recipeId: recipeId,
                calories: calories,
                proteins: proteins,
                carbohydrates: carbohydrates,
                fiber: fiber,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String recipeId,
                Value<int?> calories = const Value.absent(),
                Value<double?> proteins = const Value.absent(),
                Value<double?> carbohydrates = const Value.absent(),
                Value<double?> fiber = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NutritionFactsCompanion.insert(
                id: id,
                recipeId: recipeId,
                calories: calories,
                proteins: proteins,
                carbohydrates: carbohydrates,
                fiber: fiber,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NutritionFactsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recipeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (recipeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.recipeId,
                                referencedTable: $$NutritionFactsTableReferences
                                    ._recipeIdTable(db),
                                referencedColumn:
                                    $$NutritionFactsTableReferences
                                        ._recipeIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$NutritionFactsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NutritionFactsTable,
      NutritionRow,
      $$NutritionFactsTableFilterComposer,
      $$NutritionFactsTableOrderingComposer,
      $$NutritionFactsTableAnnotationComposer,
      $$NutritionFactsTableCreateCompanionBuilder,
      $$NutritionFactsTableUpdateCompanionBuilder,
      (NutritionRow, $$NutritionFactsTableReferences),
      NutritionRow,
      PrefetchHooks Function({bool recipeId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$DietaryCatalogTableTableManager get dietaryCatalog =>
      $$DietaryCatalogTableTableManager(_db, _db.dietaryCatalog);
  $$RecipesTableTableManager get recipes =>
      $$RecipesTableTableManager(_db, _db.recipes);
  $$FavoritesTableTableManager get favorites =>
      $$FavoritesTableTableManager(_db, _db.favorites);
  $$UserDietaryPrefsTableTableManager get userDietaryPrefs =>
      $$UserDietaryPrefsTableTableManager(_db, _db.userDietaryPrefs);
  $$RecipeDietaryJunctionTableTableManager get recipeDietaryJunction =>
      $$RecipeDietaryJunctionTableTableManager(_db, _db.recipeDietaryJunction);
  $$NutritionFactsTableTableManager get nutritionFacts =>
      $$NutritionFactsTableTableManager(_db, _db.nutritionFacts);
}
