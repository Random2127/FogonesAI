import 'package:fogonesia/features/recipe/model/nutrition_info.dart';

/// Feature model for a recipe (UI, Gemini JSON, and `recipes` table mapping).
///
/// **Identity:** [id] is a UUID string assigned on insert (null until saved).
/// **Owner:** [userId] matches `recipes.user_id` after save.
///
/// **Time fields:** Gemini still returns a single `time`; [fromJson] maps it to
/// [prepTime]. [displayTimeMinutes] sums prep + cook for chips and detail meta.
class Recipe {
  final String? id;
  final String? userId;
  final String title;
  final String description;
  final List<String> ingredients;
  final List<String> instructions;
  final int? prepTime;
  final int? cookTime;
  final int? servings;
  final String? difficulty;
  final String? imageUrl;

  /// Parsed from Gemini; persisted in `nutrition` when saving a favourite.
  final NutritionInfo? nutrition;

  Recipe({
    this.id,
    this.userId,
    required this.title,
    required this.description,
    required this.ingredients,
    required this.instructions,
    this.prepTime,
    this.cookTime,
    this.servings,
    this.difficulty,
    this.imageUrl,
    this.nutrition,
  });

  /// Minutes to show in UI (prep + cook; 0 if both null).
  int get displayTimeMinutes => (prepTime ?? 0) + (cookTime ?? 0);

  Recipe copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    List<String>? ingredients,
    List<String>? instructions,
    int? prepTime,
    int? cookTime,
    int? servings,
    String? difficulty,
    String? imageUrl,
    NutritionInfo? nutrition,
  }) {
    return Recipe(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
      prepTime: prepTime ?? this.prepTime,
      cookTime: cookTime ?? this.cookTime,
      servings: servings ?? this.servings,
      difficulty: difficulty ?? this.difficulty,
      imageUrl: imageUrl ?? this.imageUrl,
      nutrition: nutrition ?? this.nutrition,
    );
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    final timeVal = json['time'];
    final time = timeVal is int
        ? timeVal
        : int.tryParse(timeVal?.toString() ?? '');
    final prep = json['prep_time'] as int? ?? time;
    final cook = json['cook_time'] as int?;
    final nut = json['nutrition'];
    return Recipe(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      ingredients: List<String>.from(json['ingredients'] as List? ?? []),
      instructions: List<String>.from(json['instructions'] as List? ?? []),
      prepTime: prep,
      cookTime: cook,
      servings: json['servings'] as int?,
      difficulty: json['difficulty'] as String?,
      imageUrl: json['image_url'] as String?,
      nutrition: nut is Map<String, dynamic>
          ? NutritionInfo.fromJson(nut)
          : NutritionInfo.fromJson(null),
    );
  }

  Map<String, dynamic> toJson() {
    final n = nutrition;
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'description': description,
      'ingredients': ingredients,
      'instructions': instructions,
      'prep_time': prepTime,
      'cook_time': cookTime,
      'servings': servings,
      'difficulty': difficulty,
      'image_url': imageUrl,
      if (n != null && n.hasAnyData)
        'nutrition': {
          'calories': n.calories,
          'proteins': n.proteins,
          'carbohydrates': n.carbohydrates,
          'fiber': n.fiber,
        },
    };
  }
}
