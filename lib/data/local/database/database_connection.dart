import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart' show getDatabasesPath;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

/// Opens the same on-disk file as the old [sqflite] helper (`app_data.db`
/// under [getDatabasesPath]), so installs keep their data after migrating
/// to Drift.
LazyDatabase openAppDatabaseConnection() {
  return LazyDatabase(() async {
    await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    final dir = await getDatabasesPath();
    final path = p.join(dir, 'app_data.db');
    final file = File(path);
    return NativeDatabase.createInBackground(file);
  });
}
