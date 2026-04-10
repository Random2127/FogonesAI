import 'package:drift/drift.dart';

/// `dietary_options` — [DATABASE SCHEMA.md] DIETARY_OPTIONS.
@DataClassName('DietaryOptionRow')
class DietaryCatalog extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get description => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'dietary_options';
}
