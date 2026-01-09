import 'package:flutter/material.dart';
import 'package:fogonesia/models/dietary_options.dart';
import 'package:fogonesia/models/recipe.dart';
import 'package:fogonesia/services/gemini_service.dart';
import 'package:fogonesia/utils/build_recipe_prompt.dart';
import 'package:fogonesia/utils/chat_message.dart';

class ChatController extends ChangeNotifier {
  final GeminiService _geminiService;

  ChatController(this._geminiService);

  bool isLoading = false;
  final List<ChatMessage> messages = [];

  Future<void> sendMessage(String userInput, DietaryOptions options) async {
    messages.add(ChatMessage.text(userInput, MessageSender.user));
    isLoading = true;
    notifyListeners(); // Show loading indicator and user message

    final prompt = buildRecipePrompt(userPrompt: userInput, options: options);

    try {
      final recipeJson = await _geminiService.generateRecipe(prompt);
      final recipe = Recipe.fromJson(recipeJson);

      messages.add(ChatMessage.recipe(recipe, MessageSender.ai));
    } catch (e) {
      messages.add(ChatMessage.text('Error: $e', MessageSender.ai));
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
