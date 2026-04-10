import 'package:drift/drift.dart';
import 'package:fogonesia/data/local/dao/dietary_dao.dart';
import 'package:fogonesia/data/local/dao/favorites_dao.dart';
import 'package:fogonesia/data/local/dao/nutrition_dao.dart';
import 'package:fogonesia/data/local/dao/recipes_dao.dart';
import 'package:fogonesia/data/local/dao/users_dao.dart';
import 'package:fogonesia/data/local/database/database_connection.dart';
import 'package:fogonesia/data/local/dietary_option_ids.dart';
import 'package:fogonesia/data/local/tables/dietary_catalog.dart';
import 'package:fogonesia/data/local/tables/favorites.dart';
import 'package:fogonesia/data/local/tables/nutrition_entries.dart';
import 'package:fogonesia/data/local/tables/recipe_dietary_options.dart';
import 'package:fogonesia/data/local/tables/recipes.dart';
import 'package:fogonesia/data/local/tables/user_dietary_preferences.dart';
import 'package:fogonesia/data/local/tables/users.dart';
import 'package:uuid/uuid.dart';

part 'app_database.g.dart';

/// Drift database per [DATABASE SCHEMA.md] (through nutrition / dietary junctions).
@DriftDatabase(
  tables: [
    Users,
    DietaryCatalog,
    Recipes,
    Favorites,
    UserDietaryPrefs,
    RecipeDietaryJunction,
    NutritionFacts,
  ],
  daos: [
    UsersDao,
    RecipesDao,
    FavoritesDao,
    DietaryDao,
    NutritionDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? openAppDatabaseConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
          await _seedDietaryCatalog();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 2) {
            await customStatement('DROP TABLE IF EXISTS favourites');
            await m.createTable(users);
            await m.createTable(recipes);
          }
          if (from < 3) {
            await m.createTable(favorites);
            const uuid = Uuid();
            final rows = await select(recipes).get();
            for (final r in rows) {
              await into(favorites).insert(
                FavoritesCompanion.insert(
                  id: uuid.v4(),
                  userId: r.userId,
                  recipeId: r.id,
                  createdAt: Value(DateTime.now()),
                ),
                mode: InsertMode.insertOrIgnore,
              );
            }
          }
          if (from < 4) {
            await m.createTable(dietaryCatalog);
            await m.createTable(userDietaryPrefs);
            await m.createTable(recipeDietaryJunction);
            await m.createTable(nutritionFacts);
            await _seedDietaryCatalog();
          }
        },
      );

  Future<void> _seedDietaryCatalog() async {
    final seeds = <(String id, String name, String desc)>[
      (DietaryOptionIds.vegan, 'Vegan', 'Plant-based; no animal products.'),
      (
        DietaryOptionIds.vegetarian,
        'Vegetarian',
        'No meat or fish; may include dairy and eggs.',
      ),
      (DietaryOptionIds.glutenFree, 'Gluten Free', 'No gluten-containing ingredients.'),
      (DietaryOptionIds.dairyFree, 'Dairy Free', 'No milk or milk products.'),
      (DietaryOptionIds.nutAllergy, 'Nut Allergy', 'Must not contain nuts.'),
      (DietaryOptionIds.fishAllergy, 'Fish Allergy', 'Must not contain fish.'),
      (
        DietaryOptionIds.shellfishAllergy,
        'Shellfish Allergy',
        'Must not contain shellfish.',
      ),
      (DietaryOptionIds.eggAllergy, 'Egg Allergy', 'Must not contain eggs.'),
    ];
    for (final e in seeds) {
      await into(dietaryCatalog).insert(
        DietaryCatalogCompanion.insert(
          id: e.$1,
          name: e.$2,
          description: Value(e.$3),
        ),
        mode: InsertMode.insertOrIgnore,
      );
    }
  }
}
