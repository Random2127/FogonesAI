// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_dao.dart';

// ignore_for_file: type=lint
mixin _$FavoritesDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTable get users => attachedDatabase.users;
  $RecipesTable get recipes => attachedDatabase.recipes;
  $FavoritesTable get favorites => attachedDatabase.favorites;
  FavoritesDaoManager get managers => FavoritesDaoManager(this);
}

class FavoritesDaoManager {
  final _$FavoritesDaoMixin _db;
  FavoritesDaoManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db.attachedDatabase, _db.users);
  $$RecipesTableTableManager get recipes =>
      $$RecipesTableTableManager(_db.attachedDatabase, _db.recipes);
  $$FavoritesTableTableManager get favorites =>
      $$FavoritesTableTableManager(_db.attachedDatabase, _db.favorites);
}
