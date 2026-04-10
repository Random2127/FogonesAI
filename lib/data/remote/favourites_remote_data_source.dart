/// **Extension point** for cloud sync — **not implemented** (no Firestore yet).
///
/// Naming keeps the historical British spelling; replace with a concrete
/// `FavoritesRemoteDataSource` (or similar) when you add sync. Implement this
/// class and inject it from a provider alongside [RecipeRepository]. Keep
/// network code out of Drift DAOs.
abstract class FavouritesRemoteDataSource {
  /// Example hook: upload or merge a single favourite after local write.
  // Future<void> pushUpsert(Recipe recipe);

  /// Example hook: remove remote copy when local row is deleted.
  // Future<void> pushDeleteByTitle(String title);

  /// Example hook: full or incremental pull to reconcile with local.
  // Future<List<Recipe>> pullAll();
}
