import 'package:drift/drift.dart';
import 'package:fogonesia/data/local/database/app_database.dart';
import 'package:fogonesia/data/local/tables/users.dart';

part 'users_dao.g.dart';

/// Local mirror of [DATABASE SCHEMA.md] `users` (Stage 1: Firebase uid as [UserRow.id]).
@DriftAccessor(tables: [Users])
class UsersDao extends DatabaseAccessor<AppDatabase> with _$UsersDaoMixin {
  UsersDao(super.db);

  Future<UserRow?> getById(String id) {
    return (select(users)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  /// Insert or replace so sign-in can refresh profile fields.
  Future<void> upsertUser(UsersCompanion row) {
    return into(users).insertOnConflictUpdate(row);
  }
}
