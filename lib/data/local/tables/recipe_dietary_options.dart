import 'package:drift/drift.dart';
import 'package:fogonesia/data/local/tables/dietary_catalog.dart';
import 'package:fogonesia/data/local/tables/recipes.dart';

/// `recipe_dietary_options` — composite PK ([DATABASE SCHEMA.md]).
class RecipeDietaryJunction extends Table {
  TextColumn get recipeId => text().references(Recipes, #id)();

  TextColumn get dietaryOptionId => text().references(DietaryCatalog, #id)();

  @override
  Set<Column> get primaryKey => {recipeId, dietaryOptionId};

  @override
  String get tableName => 'recipe_dietary_options';
}
