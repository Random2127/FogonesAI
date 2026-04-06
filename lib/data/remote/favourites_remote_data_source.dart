/// **Extension point** for cloud sync — not used yet.
///
/// When you add Firestore (or similar), implement this class and pass it into
/// [FavouritesRepositoryImpl] via [favouritesRepositoryProvider]. Keep network
/// code out of [FavouritesDao] so local DB rules stay simple and testable.
abstract class FavouritesRemoteDataSource {
  /// Example hook: upload or merge a single favourite after local write.
  // Future<void> pushUpsert(Recipe recipe);

  /// Example hook: remove remote copy when local row is deleted.
  // Future<void> pushDeleteByTitle(String title);

  /// Example hook: full or incremental pull to reconcile with local.
  // Future<List<Recipe>> pullAll();
}
