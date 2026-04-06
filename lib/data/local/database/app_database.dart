import 'package:drift/drift.dart';
import 'package:fogonesia/data/local/dao/favourites_dao.dart';
import 'package:fogonesia/data/local/database/database_connection.dart';
import 'package:fogonesia/data/local/tables/favourites.dart';

part 'app_database.g.dart';

/// Root Drift database for the app: **registered tables, DAOs, schema version**.
///
/// Opened via [openAppDatabaseConnection] (same `app_data.db` path as legacy sqflite).
/// Generated APIs (e.g. [favouritesDao]) live in `app_database.g.dart`.
@DriftDatabase(
  tables: [Favourites],
  daos: [FavouritesDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? openAppDatabaseConnection());

  @override
  int get schemaVersion => 1;

  /// New installs: create all tables. Upgrades: add steps when [schemaVersion] increases.
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
