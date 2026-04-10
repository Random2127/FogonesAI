import 'package:drift/drift.dart';
import 'package:fogonesia/data/local/tables/dietary_catalog.dart';
import 'package:fogonesia/data/local/tables/users.dart';

/// `user_dietary_preferences` — composite PK ([DATABASE SCHEMA.md]).
class UserDietaryPrefs extends Table {
  TextColumn get userId => text().references(Users, #id)();

  TextColumn get dietaryOptionId => text().references(DietaryCatalog, #id)();

  @override
  Set<Column> get primaryKey => {userId, dietaryOptionId};

  @override
  String get tableName => 'user_dietary_preferences';
}
