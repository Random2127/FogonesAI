import 'package:shared_preferences/shared_preferences.dart';

class DietaryOptions {
  final bool isVegan;
  final bool isVegetarian;
  final bool isGlutenFree;
  final bool isDairyFree;
  final bool nutAllergy;
  final bool fishAllergy;
  final bool shellfishAllergy;
  final bool eggAllergy;

  DietaryOptions({
    this.isVegan = false,
    this.isVegetarian = false,
    this.isGlutenFree = false,
    this.isDairyFree = false,
    this.nutAllergy = false,
    this.fishAllergy = false,
    this.shellfishAllergy = false,
    this.eggAllergy = false,
  });

  // Load from SharePrefs
  static DietaryOptions fromPrefs(SharedPreferences prefs) {
    return DietaryOptions(
      isVegan: prefs.getBool('isVegan') ?? false,
      isVegetarian: prefs.getBool('isVegetarian') ?? false,
      isGlutenFree: prefs.getBool('isGlutenFree') ?? false,
      isDairyFree: prefs.getBool('isDairyFree') ?? false,
      nutAllergy: prefs.getBool('nutAllergy') ?? false,
      fishAllergy: prefs.getBool('fishAllergy') ?? false,
      shellfishAllergy: prefs.getBool('shellfishAllergy') ?? false,
      eggAllergy: prefs.getBool('eggAllergy') ?? false,
    );
  }

  // Save to SharePrefs
  Future<void> saveToPrefs(SharedPreferences prefs) async {
    await prefs.setBool('isVegan', isVegan);
    await prefs.setBool('isVegetarian', isVegetarian);
    await prefs.setBool('isGlutenFree', isGlutenFree);
    await prefs.setBool('isDairyFree', isDairyFree);
    await prefs.setBool('nutAllergy', nutAllergy);
    await prefs.setBool('fishAllergy', fishAllergy);
    await prefs.setBool('shellfishAllergy', shellfishAllergy);
    await prefs.setBool('eggAllergy', eggAllergy);
  }
}
