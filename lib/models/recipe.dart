import 'dart:convert';

class Recipe {
  final String title;
  final String description;
  final List<String> ingredients;
  final List<String> instructions;
  final int time;

  Recipe({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.instructions,
    required this.time,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      description: json['description'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: List<String>.from(json['instructions']),
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'ingredients': ingredients,
      'instructions': instructions,
      'time': time,
    };
  }

  static Recipe fromDbMap(Map<String, dynamic> map) {
    return Recipe(
      title: map['title'],
      description: map['description'],
      ingredients: List<String>.from(jsonDecode(map['ingredients'])),
      instructions: List<String>.from(jsonDecode(map['instructions'])),
      time: map['time'],
    );
  }
}

// I could have added this to the class but extension is cleaner
// Avoid persistence and logic from mixing
extension RecipeDbMapper on Recipe {
  Map<String, dynamic> toDbMap() {
    return {
      'title': title,
      'description': description,
      'ingredients': jsonEncode(ingredients),
      'instructions': jsonEncode(instructions),
      'time': time,
    };
  }
}
