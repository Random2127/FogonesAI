import 'package:flutter/material.dart';
import 'package:fogonesia/models/dietary_options.dart';
import 'package:fogonesia/services/gemini_service.dart';
import 'package:fogonesia/utils/build_recipe_prompt.dart';
import 'package:fogonesia/utils/chat_message.dart';

class ChatController extends ChangeNotifier {
  final GeminiService _geminiService;

  ChatController(this._geminiService);

  bool isLoading = false;
  final List<ChatMessage> messages = [];

  Future<void> sendMessage(String userInput, DietaryOptions options) async {
    messages.add(ChatMessage(userInput, MessageSender.user));
    isLoading = true;
    notifyListeners();

    final prompt = buildRecipePrompt(userPrompt: userInput, options: options);

    try {
      final response = await _geminiService.generateRecipe(prompt);
      messages.add(ChatMessage(response, MessageSender.ai));
    } catch (e) {
      messages.add(ChatMessage('Error: $e', MessageSender.ai));
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
