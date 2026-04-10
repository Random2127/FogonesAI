import 'package:drift/drift.dart';
import 'package:fogonesia/data/local/tables/users.dart';

/// `recipes` — see root [DATABASE SCHEMA.md] (RECIPES).
///
/// JSON columns are stored as TEXT (encode/decode in the repository).
@DataClassName('RecipeRow')
class Recipes extends Table {
  TextColumn get id => text()();

  TextColumn get userId => text().references(Users, #id)();

  TextColumn get title => text()();

  TextColumn get description => text().nullable()();

  TextColumn get ingredients => text().nullable()();

  TextColumn get instructions => text().nullable()();

  IntColumn get prepTime => integer().nullable()();

  IntColumn get cookTime => integer().nullable()();

  IntColumn get servings => integer().nullable()();

  TextColumn get difficulty => text().nullable()();

  TextColumn get imageUrl => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'recipes';
}
