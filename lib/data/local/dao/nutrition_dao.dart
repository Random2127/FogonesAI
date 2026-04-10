import 'package:drift/drift.dart';
import 'package:fogonesia/data/local/database/app_database.dart';
import 'package:fogonesia/data/local/tables/nutrition_entries.dart';

part 'nutrition_dao.g.dart';

/// `nutrition` rows ([DATABASE SCHEMA.md]).
@DriftAccessor(tables: [NutritionFacts])
class NutritionDao extends DatabaseAccessor<AppDatabase> with _$NutritionDaoMixin {
  NutritionDao(super.db);

  Future<NutritionRow?> getByRecipeId(String recipeId) {
    return (select(nutritionFacts)..where((t) => t.recipeId.equals(recipeId)))
        .getSingleOrNull();
  }

  Future<void> deleteByRecipeId(String recipeId) async {
    await (delete(nutritionFacts)..where((t) => t.recipeId.equals(recipeId)))
        .go();
  }

  Future<void> insertNutrition(NutritionFactsCompanion row) {
    return into(nutritionFacts).insert(row);
  }
}
