import 'package:drift/drift.dart';
import 'package:fogonesia/data/local/tables/recipes.dart';

/// `nutrition` — [DATABASE SCHEMA.md] NUTRITION (DECIMAL → REAL in SQLite).
@DataClassName('NutritionRow')
class NutritionFacts extends Table {
  TextColumn get id => text()();

  TextColumn get recipeId => text().references(Recipes, #id)();

  IntColumn get calories => integer().nullable()();

  RealColumn get proteins => real().nullable()();

  RealColumn get carbohydrates => real().nullable()();

  RealColumn get fiber => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'nutrition';
}
