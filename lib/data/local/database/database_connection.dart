import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

/// Returns the [LazyDatabase] used by [AppDatabase].
///
/// Opens `app_data.db` under the app support directory (via [path_provider]),
/// not the legacy sqflite `databases/` path — **existing installs may start
/// with an empty DB** after this change; see [.docs/DRIFT_PERSISTENCE.md].
LazyDatabase openAppDatabaseConnection() {
  return LazyDatabase(() async {
    await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    final root = await getApplicationSupportDirectory();
    final dir = Directory(p.join(root.path, 'drift'));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    final path = p.join(dir.path, 'app_data.db');
    final file = File(path);
    return NativeDatabase.createInBackground(file);
  });
}
