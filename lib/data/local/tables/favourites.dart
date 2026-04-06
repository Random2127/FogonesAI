import 'package:drift/drift.dart';

/// Drift definition of SQLite table `favourites` — matches the legacy sqflite schema.
///
/// Drift generates the row class [Favourite] and [FavouritesCompanion] (see `app_database.g.dart`).
/// Columns are nullable where the original `CREATE TABLE` omitted `NOT NULL`,
/// so existing rows remain valid.
class Favourites extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().unique()();

  TextColumn get description => text().nullable()();

  TextColumn get ingredients => text().nullable()();

  TextColumn get instructions => text().nullable()();

  IntColumn get time => integer().nullable()();

  @override
  String get tableName => 'favourites';
}
