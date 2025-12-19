// This is where we build the prompt for the recipe generation AI model.
import 'package:fogonesia/models/dietary_options.dart';

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
 "cuisine": "...", "ingredients": ["..."], "instructions": ["..."]}

Dietary constraints:
${constraints.isEmpty ? "None" : constraints.join("\n")}

User request:
$userPrompt
''';
}
