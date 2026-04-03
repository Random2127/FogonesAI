import 'package:fogonesia/features/recipe/model/recipe.dart';

/// Application-facing persistence for saved (favourite) recipes.
///
/// Implemented in the data layer; may combine local + remote sources later.
abstract class FavouritesRepository {
  Future<List<Recipe>> getAll();

  Stream<List<Recipe>> watchAll();

  Future<void> upsert(Recipe recipe);

  Future<void> deleteByTitle(String title);

  Future<void> update(Recipe recipe);

  Future<bool> existsWithTitle(String title);
}
