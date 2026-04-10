// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dietary_dao.dart';

// ignore_for_file: type=lint
mixin _$DietaryDaoMixin on DatabaseAccessor<AppDatabase> {
  $DietaryCatalogTable get dietaryCatalog => attachedDatabase.dietaryCatalog;
  $UsersTable get users => attachedDatabase.users;
  $UserDietaryPrefsTable get userDietaryPrefs =>
      attachedDatabase.userDietaryPrefs;
  $RecipesTable get recipes => attachedDatabase.recipes;
  $RecipeDietaryJunctionTable get recipeDietaryJunction =>
      attachedDatabase.recipeDietaryJunction;
  DietaryDaoManager get managers => DietaryDaoManager(this);
}

class DietaryDaoManager {
  final _$DietaryDaoMixin _db;
  DietaryDaoManager(this._db);
  $$DietaryCatalogTableTableManager get dietaryCatalog =>
      $$DietaryCatalogTableTableManager(
        _db.attachedDatabase,
        _db.dietaryCatalog,
      );
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db.attachedDatabase, _db.users);
  $$UserDietaryPrefsTableTableManager get userDietaryPrefs =>
      $$UserDietaryPrefsTableTableManager(
        _db.attachedDatabase,
        _db.userDietaryPrefs,
      );
  $$RecipesTableTableManager get recipes =>
      $$RecipesTableTableManager(_db.attachedDatabase, _db.recipes);
  $$RecipeDietaryJunctionTableTableManager get recipeDietaryJunction =>
      $$RecipeDietaryJunctionTableTableManager(
        _db.attachedDatabase,
        _db.recipeDietaryJunction,
      );
}
