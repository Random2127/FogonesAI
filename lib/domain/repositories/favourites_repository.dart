import 'package:fogonesia/features/recipe/model/recipe.dart';

/// **Domain contract** for “saved recipes” (favourites): what the app needs, in [Recipe] terms.
///
/// **Why it exists:** UI/controllers depend on this type, not on Drift/SQLite, so you can
/// swap or combine storage (local file, Firestore, mocks) behind one API.
///
/// **Implementation:** [FavouritesRepositoryImpl] in `lib/data/repositories/`.
abstract class FavouritesRepository {
  /// All favourites from local storage, newest stable order defined by the DAO.
  Future<List<Recipe>> getAll();

  /// Same rows as [getAll], as a stream (for reactive UIs that listen to the DB).
  Stream<List<Recipe>> watchAll();

  /// Insert or replace the row keyed by unique [Recipe.title] (matches legacy behaviour).
  Future<void> upsert(Recipe recipe);

  /// Remove the favourite with this title.
  Future<void> deleteByTitle(String title);

  /// Update fields for the row with the same title as [recipe] (title is the key).
  Future<void> update(Recipe recipe);

  Future<bool> existsWithTitle(String title);
}
