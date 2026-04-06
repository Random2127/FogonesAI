import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/data/local/database/app_database.dart';
import 'package:fogonesia/data/local/dao/favourites_dao.dart';
import 'package:fogonesia/data/repositories/favourites_repository_impl.dart';
import 'package:fogonesia/domain/repositories/favourites_repository.dart';

/// Riverpod wiring for Drift: **database → DAO → repository**.
///
/// Features should depend on [favouritesRepositoryProvider] (or a narrower
/// provider), not on [appDatabaseProvider] directly, so storage can be faked in tests.

/// Single [AppDatabase] for the app process; closed when the provider is disposed.
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

/// Table-level access for `favourites` only; still “low level” — prefer the repository.
final favouritesDaoProvider = Provider<FavouritesDao>((ref) {
  return ref.watch(appDatabaseProvider).favouritesDao;
});

/// What controllers use: [FavouritesRepository] backed by [FavouritesRepositoryImpl].
/// Pass a non-null `remote` when a [FavouritesRemoteDataSource] exists (e.g. Firestore).
final favouritesRepositoryProvider = Provider<FavouritesRepository>((ref) {
  return FavouritesRepositoryImpl(
    ref.watch(favouritesDaoProvider),
    remote: null,
  );
});
