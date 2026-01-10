import 'package:flutter/material.dart';
import 'package:fogonesia/models/dietary_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DietaryController extends ChangeNotifier {
  final SharedPreferences _prefs;
  late DietaryOptions _options;
  DietaryOptions get options => _options;

  DietaryController(this._prefs) {
    _options = DietaryOptions.fromPrefs(_prefs);
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
    // If a parameter is null, retain the existing value
    _options = DietaryOptions(
      isVegan: isVegan ?? _options.isVegan,
      isVegetarian: isVegetarian ?? _options.isVegetarian,
      isGlutenFree: isGlutenFree ?? _options.isGlutenFree,
      isDairyFree: isDairyFree ?? _options.isDairyFree,
      nutAllergy: nutAllergy ?? _options.nutAllergy,
      fishAllergy: fishAllergy ?? _options.fishAllergy,
      shellfishAllergy: shellfishAllergy ?? _options.shellfishAllergy,
      eggAllergy: eggAllergy ?? _options.eggAllergy,
    );
    await _options.saveToPrefs(_prefs);
    notifyListeners();
  }

  void resetOption() async {
    _options = DietaryOptions();
    _options.saveToPrefs(_prefs);
    notifyListeners();
  }
}
