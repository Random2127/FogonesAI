import 'package:fogonesia/data/local/dao/dietary_dao.dart';
import 'package:fogonesia/data/local/dietary_option_ids.dart';
import 'package:fogonesia/domain/repositories/dietary_repository.dart';
import 'package:fogonesia/features/dietary/model/dietary_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Maps [DietaryOptions] ↔ `user_dietary_preferences` junction rows.
class DietaryRepositoryImpl implements DietaryRepository {
  DietaryRepositoryImpl(this._dao);

  final DietaryDao _dao;

  static const _migrationKey = 'dietary_prefs_migrated_to_drift_v4';

  static const _legacyPrefKeys = <String>[
    'isVegan',
    'isVegetarian',
    'isGlutenFree',
    'isDairyFree',
    'nutAllergy',
    'fishAllergy',
    'shellfishAllergy',
    'eggAllergy',
  ];

  @override
  Future<void> migrateLegacySharedPreferencesIfNeeded(
    SharedPreferences prefs,
    String userId,
  ) async {
    if (prefs.getBool(_migrationKey) == true) return;
    final legacy = DietaryOptions.fromPrefs(prefs);
    await saveUserPreferences(userId, legacy);
    await prefs.setBool(_migrationKey, true);
    for (final key in _legacyPrefKeys) {
      await prefs.remove(key);
    }
  }

  @override
  Future<DietaryOptions> getUserPreferences(String userId) async {
    final ids = await _dao.getUserOptionIds(userId);
    final set = ids.toSet();
    return DietaryOptions(
      isVegan: set.contains(DietaryOptionIds.vegan),
      isVegetarian: set.contains(DietaryOptionIds.vegetarian),
      isGlutenFree: set.contains(DietaryOptionIds.glutenFree),
      isDairyFree: set.contains(DietaryOptionIds.dairyFree),
      nutAllergy: set.contains(DietaryOptionIds.nutAllergy),
      fishAllergy: set.contains(DietaryOptionIds.fishAllergy),
      shellfishAllergy: set.contains(DietaryOptionIds.shellfishAllergy),
      eggAllergy: set.contains(DietaryOptionIds.eggAllergy),
    );
  }

  @override
  Future<void> saveUserPreferences(String userId, DietaryOptions options) async {
    await _dao.clearUserPreferences(userId);
    Future<void> addIf(bool on, String optionId) async {
      if (on) await _dao.insertUserPreference(userId, optionId);
    }

    await addIf(options.isVegan, DietaryOptionIds.vegan);
    await addIf(options.isVegetarian, DietaryOptionIds.vegetarian);
    await addIf(options.isGlutenFree, DietaryOptionIds.glutenFree);
    await addIf(options.isDairyFree, DietaryOptionIds.dairyFree);
    await addIf(options.nutAllergy, DietaryOptionIds.nutAllergy);
    await addIf(options.fishAllergy, DietaryOptionIds.fishAllergy);
    await addIf(options.shellfishAllergy, DietaryOptionIds.shellfishAllergy);
    await addIf(options.eggAllergy, DietaryOptionIds.eggAllergy);
  }
}
