import 'package:fogonesia/features/dietary/model/dietary_options.dart';

// Build the prompt for Gemini API
String buildRecipePrompt({
  required String userPrompt,
  required DietaryOptions options,
}) {
  final constraints = <String>[];

  if (options.isVegan) {
    constraints.add("The recipe must be vegan.");
  }
  if (options.isVegetarian) {
    constraints.add("The recipe must be vegetarian.");
  }
  if (options.isGlutenFree) {
    constraints.add("The recipe must be gluten-free.");
  }
  if (options.isDairyFree) {
    constraints.add("The recipe must be dairy-free.");
  }
  if (options.nutAllergy) {
    constraints.add("The recipe must not contain nuts.");
  }
  if (options.fishAllergy) {
    constraints.add("The recipe must not contain fish.");
  }
  if (options.shellfishAllergy) {
    constraints.add("The recipe must not contain shellfish.");
  }
  if (options.eggAllergy) {
    constraints.add("The recipe must not contain eggs.");
  }

  return '''
Return exactly ONE JSON object.
The response MUST start with '{' and end with '}'.
Do NOT include:
- explanations
- markdown
- backticks
- extra text before or after the JSON

JSON structure:
{"title": "...", "description": "...", "time": 30, "servings": 2,
 "cuisine": "...", "ingredients": ["..."], "instructions": ["..."],
 "nutrition": {"calories": 320, "proteins": 12.5, "carbohydrates": 40, "fiber": 6}}

Include "nutrition" only when you can estimate reasonable values from the recipe; otherwise omit "nutrition" or use null fields.

Dietary constraints:
${constraints.isEmpty ? "None" : constraints.join("\n")}

User request:
$userPrompt
''';
}
