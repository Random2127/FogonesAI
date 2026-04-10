import 'package:fogonesia/features/dietary/model/dietary_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// User dietary toggles backed by `user_dietary_preferences` ([DATABASE SCHEMA.md]).
abstract class DietaryRepository {
  /// One-time import from legacy [SharedPreferences] bool keys into the DB.
  Future<void> migrateLegacySharedPreferencesIfNeeded(
    SharedPreferences prefs,
    String userId,
  );

  Future<DietaryOptions> getUserPreferences(String userId);

  /// Replaces all preference rows for [userId] with [options].
  Future<void> saveUserPreferences(String userId, DietaryOptions options);
}
