import 'package:drift/drift.dart';
import 'package:fogonesia/data/local/dao/favourites_dao.dart';
import 'package:fogonesia/data/local/database/database_connection.dart';
import 'package:fogonesia/data/local/tables/favourites.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Favourites],
  daos: [FavouritesDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? openAppDatabaseConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 1) {
            await m.createAll();
          }
        },
      );
}
