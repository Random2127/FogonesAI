// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourites_dao.dart';

// ignore_for_file: type=lint
mixin _$FavouritesDaoMixin on DatabaseAccessor<AppDatabase> {
  $FavouritesTable get favourites => attachedDatabase.favourites;
  FavouritesDaoManager get managers => FavouritesDaoManager(this);
}

class FavouritesDaoManager {
  final _$FavouritesDaoMixin _db;
  FavouritesDaoManager(this._db);
  $$FavouritesTableTableManager get favourites =>
      $$FavouritesTableTableManager(_db.attachedDatabase, _db.favourites);
}
