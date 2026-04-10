import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/core/settings/theme_controller.dart';
import 'package:fogonesia/data/providers/database_providers.dart';
import 'package:fogonesia/features/auth/auth_providers.dart';
import 'package:fogonesia/features/dietary/model/dietary_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dietaryControllerProvider =
    AsyncNotifierProvider<DietaryController, DietaryOptions>(
  DietaryController.new,
);

/// Dietary toggles from `user_dietary_preferences` ([DATABASE SCHEMA.md]).
///
/// Legacy [SharedPreferences] bools are imported once per user via
/// [DietaryRepository.migrateLegacySharedPreferencesIfNeeded].
class DietaryController extends AsyncNotifier<DietaryOptions> {
  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  @override
  Future<DietaryOptions> build() async {
    final user = ref.watch(firebaseAuthProvider).currentUser;
    ref.watch(sharedPreferencesProvider);
    if (user == null) {
      return DietaryOptions();
    }
    final repo = ref.read(dietaryRepositoryProvider);
    await repo.migrateLegacySharedPreferencesIfNeeded(_prefs, user.uid);
    return repo.getUserPreferences(user.uid);
  }

  Future<void> updateOption({
    bool? isVegan,
    bool? isVegetarian,
    bool? isGlutenFree,
    bool? isDairyFree,
    bool? nutAllergy,
    bool? fishAllergy,
    bool? shellfishAllergy,
    bool? eggAllergy,
  }) async {
    final user = ref.read(firebaseAuthProvider).currentUser;
    if (user == null) return;

    final prev = switch (state) {
      AsyncData<DietaryOptions>(:final value) => value,
      _ => DietaryOptions(),
    };
    final next = DietaryOptions(
      isVegan: isVegan ?? prev.isVegan,
      isVegetarian: isVegetarian ?? prev.isVegetarian,
      isGlutenFree: isGlutenFree ?? prev.isGlutenFree,
      isDairyFree: isDairyFree ?? prev.isDairyFree,
      nutAllergy: nutAllergy ?? prev.nutAllergy,
      fishAllergy: fishAllergy ?? prev.fishAllergy,
      shellfishAllergy: shellfishAllergy ?? prev.shellfishAllergy,
      eggAllergy: eggAllergy ?? prev.eggAllergy,
    );
    await ref.read(dietaryRepositoryProvider).saveUserPreferences(user.uid, next);
    state = AsyncData(next);
  }

  Future<void> resetOption() async {
    final user = ref.read(firebaseAuthProvider).currentUser;
    if (user == null) return;
    final next = DietaryOptions();
    await ref.read(dietaryRepositoryProvider).saveUserPreferences(user.uid, next);
    state = AsyncData(next);
  }
}
