/// Stable UUIDs for seeded `dietary_options` rows ([DATABASE SCHEMA.md]).
///
/// Do not change these values after shipping — they are referenced in user data.
abstract final class DietaryOptionIds {
  static const vegan = 'd0000001-0000-4000-8000-000000000001';
  static const vegetarian = 'd0000002-0000-4000-8000-000000000002';
  static const glutenFree = 'd0000003-0000-4000-8000-000000000003';
  static const dairyFree = 'd0000004-0000-4000-8000-000000000004';
  static const nutAllergy = 'd0000005-0000-4000-8000-000000000005';
  static const fishAllergy = 'd0000006-0000-4000-8000-000000000006';
  static const shellfishAllergy = 'd0000007-0000-4000-8000-000000000007';
  static const eggAllergy = 'd0000008-0000-4000-8000-000000000008';
}
