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
}
