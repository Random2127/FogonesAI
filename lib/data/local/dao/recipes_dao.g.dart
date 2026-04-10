// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_dao.dart';

// ignore_for_file: type=lint
mixin _$RecipesDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTable get users => attachedDatabase.users;
  $RecipesTable get recipes => attachedDatabase.recipes;
  RecipesDaoManager get managers => RecipesDaoManager(this);
}

class RecipesDaoManager {
  final _$RecipesDaoMixin _db;
  RecipesDaoManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db.attachedDatabase, _db.users);
  $$RecipesTableTableManager get recipes =>
      $$RecipesTableTableManager(_db.attachedDatabase, _db.recipes);
}
