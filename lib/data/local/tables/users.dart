import 'package:drift/drift.dart';

/// `users` — see root [DATABASE SCHEMA.md] (USERS).
///
/// [id] is the Firebase Auth uid (stored as TEXT UUID-shaped string).
/// [DataClassName] avoids clashing with Firebase’s `User` type.
@DataClassName('UserRow')
class Users extends Table {
  TextColumn get id => text()();

  TextColumn get userHash => text().unique()();

  TextColumn get username => text()();

  TextColumn get email => text().unique()();

  TextColumn get passwordHash => text()();

  DateTimeColumn get createdAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'users';
}
