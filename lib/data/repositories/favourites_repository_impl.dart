import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fogonesia/data/local/dao/favourites_dao.dart';
import 'package:fogonesia/data/local/database/app_database.dart';
import 'package:fogonesia/data/remote/favourites_remote_data_source.dart';
import 'package:fogonesia/domain/repositories/favourites_repository.dart';
import 'package:fogonesia/features/recipe/model/recipe.dart';

/// **Data-layer** implementation of [FavouritesRepository].
///
/// **Responsibilities:**
/// - Call [FavouritesDao] for all SQLite access (Drift types only in the DAO).
/// - Map Drift row type [Favourite] ↔ feature model [Recipe] (including JSON columns).
/// - Later: optional [_remote] for sync after local writes.
class FavouritesRepositoryImpl implements FavouritesRepository {
  FavouritesRepositoryImpl(
    this._dao, {
    FavouritesRemoteDataSource? remote,
  }) : _remote = remote;

  final FavouritesDao _dao;

  /// Reserved for future Firestore (or other) sync. Wire [remote] when
  /// implementations exist; call from [upsert] / [deleteByTitle] / [update].
  final FavouritesRemoteDataSource? _remote;

  FavouritesRemoteDataSource? get remoteDataSource => _remote;

  // --- Mapping (Drift ↔ Recipe) ---

  Recipe _rowToRecipe(Favourite row) {
    return Recipe(
      title: row.title,
      description: row.description ?? '',
      ingredients: _decodeList(row.ingredients),
      instructions: _decodeList(row.instructions),
      time: row.time ?? 0,
    );
  }

  List<String> _decodeList(String? json) {
    if (json == null || json.isEmpty) return [];
    try {
      final decoded = jsonDecode(json);
      if (decoded is List) {
        return List<String>.from(decoded.map((e) => e.toString()));
      }
    } catch (_) {
      // Malformed legacy row: surface as empty list.
    }
    return [];
  }

  FavouritesCompanion _recipeToCompanion(Recipe recipe) {
    return FavouritesCompanion.insert(
      title: recipe.title,
      description: Value(recipe.description),
      ingredients: Value(jsonEncode(recipe.ingredients)),
      instructions: Value(jsonEncode(recipe.instructions)),
      time: Value(recipe.time),
    );
  }

  FavouritesCompanion _recipeToUpdateCompanion(Recipe recipe) {
    return FavouritesCompanion(
      description: Value(recipe.description),
      ingredients: Value(jsonEncode(recipe.ingredients)),
      instructions: Value(jsonEncode(recipe.instructions)),
      time: Value(recipe.time),
    );
  }

  // --- FavouritesRepository ---

  @override
  Future<List<Recipe>> getAll() async {
    final rows = await _dao.getAll();
    return rows.map(_rowToRecipe).toList();
  }

  @override
  Stream<List<Recipe>> watchAll() {
    return _dao.watchAll().map((rows) => rows.map(_rowToRecipe).toList());
  }

  @override
  Future<void> upsert(Recipe recipe) async {
    await _dao.insertReplace(_recipeToCompanion(recipe));
  }

  @override
  Future<void> deleteByTitle(String title) async {
    await _dao.deleteByTitle(title);
  }

  @override
  Future<void> update(Recipe recipe) async {
    await _dao.updateByTitle(
      recipe.title,
      _recipeToUpdateCompanion(recipe),
    );
  }

  @override
  Future<bool> existsWithTitle(String title) {
    return _dao.existsWithTitle(title);
  }
}
