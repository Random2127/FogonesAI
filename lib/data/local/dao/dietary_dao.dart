import 'package:drift/drift.dart';
import 'package:fogonesia/data/local/database/app_database.dart';
import 'package:fogonesia/data/local/tables/dietary_catalog.dart';
import 'package:fogonesia/data/local/tables/recipe_dietary_options.dart';
import 'package:fogonesia/data/local/tables/user_dietary_preferences.dart';

part 'dietary_dao.g.dart';

/// Catalog, user prefs, and recipe↔dietary links ([DATABASE SCHEMA.md]).
@DriftAccessor(
  tables: [DietaryCatalog, UserDietaryPrefs, RecipeDietaryJunction],
)
class DietaryDao extends DatabaseAccessor<AppDatabase> with _$DietaryDaoMixin {
  DietaryDao(super.db);

  Future<List<DietaryOptionRow>> listCatalog() {
    return (select(dietaryCatalog)..orderBy([(t) => OrderingTerm.asc(t.name)]))
        .get();
  }

  Future<List<String>> getUserOptionIds(String userId) async {
    final rows = await (select(userDietaryPrefs)
          ..where((t) => t.userId.equals(userId)))
        .get();
    return rows.map((r) => r.dietaryOptionId).toList();
  }

  Future<void> clearUserPreferences(String userId) async {
    await (delete(userDietaryPrefs)..where((t) => t.userId.equals(userId)))
        .go();
  }

  Future<void> insertUserPreference(
    String userId,
    String dietaryOptionId,
  ) {
    return into(userDietaryPrefs).insert(
      UserDietaryPrefsCompanion.insert(
        userId: userId,
        dietaryOptionId: dietaryOptionId,
      ),
      mode: InsertMode.insertOrIgnore,
    );
  }

  Future<void> deleteRecipeDietaryLinks(String recipeId) async {
    await (delete(recipeDietaryJunction)
          ..where((t) => t.recipeId.equals(recipeId)))
        .go();
  }

  Future<void> insertRecipeDietaryLink(String recipeId, String optionId) {
    return into(recipeDietaryJunction).insert(
      RecipeDietaryJunctionCompanion.insert(
        recipeId: recipeId,
        dietaryOptionId: optionId,
      ),
      mode: InsertMode.insertOrIgnore,
    );
  }

  Future<List<String>> getRecipeOptionIds(String recipeId) async {
    final rows = await (select(recipeDietaryJunction)
          ..where((t) => t.recipeId.equals(recipeId)))
        .get();
    return rows.map((r) => r.dietaryOptionId).toList();
  }

  /// Names for [optionIds] preserving catalog sort order where possible.
  Future<List<String>> namesForOptionIds(List<String> optionIds) async {
    if (optionIds.isEmpty) return [];
    final catalog = await listCatalog();
    final byId = {for (final r in catalog) r.id: r.name};
    return optionIds.map((id) => byId[id] ?? id).toList();
  }
}
