/// Placeholder for a future remote store (e.g. Firestore).
///
/// The repository can call into this interface after sync rules and mapping
/// are defined. No network implementation yet.
abstract class FavouritesRemoteDataSource {
  /// Example hook: upload or merge a single favourite after local write.
  // Future<void> pushUpsert(Recipe recipe);

  /// Example hook: remove remote copy when local row is deleted.
  // Future<void> pushDeleteByTitle(String title);

  /// Example hook: full or incremental pull to reconcile with local.
  // Future<List<Recipe>> pullAll();
}
