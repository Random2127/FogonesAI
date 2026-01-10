// SQL helper for CRUD operations
import 'package:fogonesia/models/recipe.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB('app_data.db');
    return _db!;
  }

  static Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  static Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favourites(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT UNIQUE,
        description TEXT,
        ingredients TEXT,
        instructions TEXT,
        time INTEGER
      );
    ''');
  }

  static Future<int> insertFavourite(Recipe recipe) async {
    final db = await database;
    return await db.insert(
      'favourites',
      recipe.toDbMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Recipe>> getFavourites() async {
    final db = await database;
    final result = await db.query('favourites');
    return result.map(Recipe.fromDbMap).toList();
  }

  static Future<int> deleteFavourite(String title) async {
    final db = await database;
    return await db.delete(
      'favourites',
      where: 'title = ?',
      whereArgs: [title],
    );
  }

  Future<void> close() async {
    final db = await database;
    db.close();
  }

  static Future<bool> isFavourite(String title) async {
    final db = await database;
    final result = await db.query(
      'favourites',
      where: 'title = ?',
      whereArgs: [title],
      limit: 1,
    );
    return result.isNotEmpty;
  }
}
