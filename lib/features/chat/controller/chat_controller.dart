import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/features/dietary/model/dietary_options.dart';
import 'package:fogonesia/features/recipe/model/recipe.dart';
import 'package:fogonesia/services/gemini_service.dart';
import 'package:fogonesia/shared/build_recipe_prompt.dart';
import 'package:fogonesia/shared/chat_message.dart';

class ChatState {
  final List<ChatMessage> messages;
  final bool isLoading;

  const ChatState({this.messages = const [], this.isLoading = false});

  ChatState copyWith({List<ChatMessage>? messages, bool? isLoading}) {
    return ChatState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

final chatControllerProvider =
    NotifierProvider<ChatController, ChatState>(ChatController.new);

class ChatController extends Notifier<ChatState> {
  @override
  ChatState build() => const ChatState();

  Future<void> sendMessage(String userInput, DietaryOptions options) async {
    final updated = [...state.messages, ChatMessage.text(userInput, MessageSender.user)];
    state = state.copyWith(messages: updated, isLoading: true);

    final prompt = buildRecipePrompt(userPrompt: userInput, options: options);

    try {
      final recipeJson = await GeminiService().generateRecipe(prompt);
      final recipe = Recipe.fromJson(recipeJson);

      state = state.copyWith(
        messages: [...state.messages, ChatMessage.recipe(recipe, MessageSender.ai)],
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        messages: [...state.messages, ChatMessage.text('Error: $e', MessageSender.ai)],
        isLoading: false,
      );
    }
  }
}
