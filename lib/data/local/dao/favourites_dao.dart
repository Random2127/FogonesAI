import 'package:drift/drift.dart';
import 'package:fogonesia/data/local/database/app_database.dart';
import 'package:fogonesia/data/local/tables/favourites.dart';

part 'favourites_dao.g.dart';

@DriftAccessor(tables: [Favourites])
class FavouritesDao extends DatabaseAccessor<AppDatabase>
    with _$FavouritesDaoMixin {
  FavouritesDao(super.db);

  Future<List<Favourite>> getAll() {
    return (select(favourites)..orderBy([(t) => OrderingTerm.asc(t.id)])).get();
  }

  Stream<List<Favourite>> watchAll() {
    return (select(favourites)..orderBy([(t) => OrderingTerm.asc(t.id)]))
        .watch();
  }

  Future<Favourite?> getByTitle(String title) {
    return (select(favourites)..where((t) => t.title.equals(title)))
        .getSingleOrNull();
  }

  Future<bool> existsWithTitle(String title) async {
    final row = await getByTitle(title);
    return row != null;
  }

  /// Matches legacy `ConflictAlgorithm.replace` on unique `title`.
  Future<int> insertReplace(FavouritesCompanion row) {
    return into(favourites).insert(row, mode: InsertMode.replace);
  }

  Future<int> deleteByTitle(String title) {
    return (delete(favourites)..where((t) => t.title.equals(title))).go();
  }

  Future<void> updateByTitle(String title, FavouritesCompanion patch) {
    return (update(favourites)..where((t) => t.title.equals(title)))
        .write(patch);
  }
}
