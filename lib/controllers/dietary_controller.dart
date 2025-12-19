import 'package:flutter/material.dart';
import 'package:fogonesia/models/dietary_options.dart';

class DietaryController extends ChangeNotifier {
  DietaryOptions _options = DietaryOptions();

  DietaryOptions get options => _options;

  void updateOptions({
    bool? isVegan,
    bool? isVegetarian,
    bool? isGlutenFree,
    bool? isDairyFree,
    bool? nutAllergy,
    bool? fishAllergy,
    bool? shellfishAllergy,
    bool? eggAllergy,
  }) {
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
    notifyListeners();
  }

  void resetOptions() {
    _options = DietaryOptions();
    notifyListeners();
  }
}
