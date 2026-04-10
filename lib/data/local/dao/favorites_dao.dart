import 'package:drift/drift.dart';
import 'package:fogonesia/data/local/database/app_database.dart';
import 'package:fogonesia/data/local/tables/favorites.dart';
import 'package:fogonesia/data/local/tables/recipes.dart';

part 'favorites_dao.g.dart';

/// `favorites` link rows + joined reads ([DATABASE SCHEMA.md] FAVORITES).
@DriftAccessor(tables: [Favorites, Recipes])
class FavoritesDao extends DatabaseAccessor<AppDatabase>
    with _$FavoritesDaoMixin {
  FavoritesDao(super.db);

  /// Recipes this user has starred (join `favorites` → `recipes`).
  Future<List<RecipeRow>> listFavoritedRecipesForUser(String userId) {
    final q = select(recipes).join([
      innerJoin(
        favorites,
        favorites.recipeId.equalsExp(recipes.id),
      ),
    ])
      ..where(favorites.userId.equals(userId))
      ..orderBy([OrderingTerm.asc(recipes.title)]);

    return q.map((row) => row.readTable(recipes)).get();
  }

  Future<void> insertFavorite(FavoritesCompanion row) {
    return into(favorites).insert(row, mode: InsertMode.insertOrIgnore);
  }

  Future<int> deleteByUserAndRecipe(String userId, String recipeId) {
    return (delete(favorites)
          ..where(
            (f) => f.userId.equals(userId) & f.recipeId.equals(recipeId),
          ))
        .go();
  }

  /// All favorite links for a recipe (before deleting the recipe row).
  Future<int> deleteByRecipeId(String recipeId) {
    return (delete(favorites)..where((f) => f.recipeId.equals(recipeId))).go();
  }

  Future<bool> isFavorited(String userId, String recipeId) async {
    final row = await (select(favorites)
          ..where(
            (f) => f.userId.equals(userId) & f.recipeId.equals(recipeId),
          ))
        .getSingleOrNull();
    return row != null;
  }
}
