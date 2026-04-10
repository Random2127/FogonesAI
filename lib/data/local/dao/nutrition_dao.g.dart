// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_dao.dart';

// ignore_for_file: type=lint
mixin _$NutritionDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTable get users => attachedDatabase.users;
  $RecipesTable get recipes => attachedDatabase.recipes;
  $NutritionFactsTable get nutritionFacts => attachedDatabase.nutritionFacts;
  NutritionDaoManager get managers => NutritionDaoManager(this);
}

class NutritionDaoManager {
  final _$NutritionDaoMixin _db;
  NutritionDaoManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db.attachedDatabase, _db.users);
  $$RecipesTableTableManager get recipes =>
      $$RecipesTableTableManager(_db.attachedDatabase, _db.recipes);
  $$NutritionFactsTableTableManager get nutritionFacts =>
      $$NutritionFactsTableTableManager(
        _db.attachedDatabase,
        _db.nutritionFacts,
      );
}
