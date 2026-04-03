import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/data/local/database/app_database.dart';
import 'package:fogonesia/data/local/dao/favourites_dao.dart';
import 'package:fogonesia/data/repositories/favourites_repository_impl.dart';
import 'package:fogonesia/domain/repositories/favourites_repository.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final favouritesDaoProvider = Provider<FavouritesDao>((ref) {
  return ref.watch(appDatabaseProvider).favouritesDao;
});

final favouritesRepositoryProvider = Provider<FavouritesRepository>((ref) {
  return FavouritesRepositoryImpl(
    ref.watch(favouritesDaoProvider),
    remote: null,
  );
});
