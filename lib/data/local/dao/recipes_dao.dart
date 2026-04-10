import 'package:drift/drift.dart';
import 'package:fogonesia/data/local/database/app_database.dart';
import 'package:fogonesia/data/local/tables/recipes.dart';

part 'recipes_dao.g.dart';

/// CRUD for `recipes` ([DATABASE SCHEMA.md] RECIPES).
@DriftAccessor(tables: [Recipes])
class RecipesDao extends DatabaseAccessor<AppDatabase> with _$RecipesDaoMixin {
  RecipesDao(super.db);

  Future<List<RecipeRow>> listByUserId(String userId) {
    return (select(recipes)
          ..where((t) => t.userId.equals(userId))
          ..orderBy([(t) => OrderingTerm.asc(t.title)]))
        .get();
  }

  Future<RecipeRow?> getById(String id) {
    return (select(recipes)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<void> insertRecipe(RecipesCompanion row) {
    return into(recipes).insert(row);
  }

  Future<void> updateRecipe(String id, RecipesCompanion patch) {
    return (update(recipes)..where((t) => t.id.equals(id))).write(patch);
  }

  Future<int> deleteById(String id) {
    return (delete(recipes)..where((t) => t.id.equals(id))).go();
  }
}
