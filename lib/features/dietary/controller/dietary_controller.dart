import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/core/settings/theme_controller.dart';
import 'package:fogonesia/features/dietary/model/dietary_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dietaryControllerProvider =
    NotifierProvider<DietaryController, DietaryOptions>(DietaryController.new);

class DietaryController extends Notifier<DietaryOptions> {
  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  @override
  DietaryOptions build() {
    return DietaryOptions.fromPrefs(_prefs);
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
    state = DietaryOptions(
      isVegan: isVegan ?? state.isVegan,
      isVegetarian: isVegetarian ?? state.isVegetarian,
      isGlutenFree: isGlutenFree ?? state.isGlutenFree,
      isDairyFree: isDairyFree ?? state.isDairyFree,
      nutAllergy: nutAllergy ?? state.nutAllergy,
      fishAllergy: fishAllergy ?? state.fishAllergy,
      shellfishAllergy: shellfishAllergy ?? state.shellfishAllergy,
      eggAllergy: eggAllergy ?? state.eggAllergy,
    );
    await state.saveToPrefs(_prefs);
  }

  Future<void> resetOption() async {
    state = DietaryOptions();
    await state.saveToPrefs(_prefs);
  }
}
