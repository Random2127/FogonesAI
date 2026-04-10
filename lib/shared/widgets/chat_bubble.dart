import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/features/chat/controller/chat_controller.dart';
import 'package:fogonesia/features/recipe/widgets/recipe_card.dart';
import 'package:fogonesia/shared/chat_message.dart';

class ChatBubble extends ConsumerWidget {
  final ChatMessage message;
  final int messageIndex;

  const ChatBubble({
    super.key,
    required this.message,
    required this.messageIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUser = message.sender == MessageSender.user;
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: _bubbleColour(isUser),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: _buildContent(context, ref),
      ),
    );
  }

  Color _bubbleColour(bool isUser) {
    if (message.type == MessageType.recipe) {
      return Colors.transparent;
    }
    return isUser
        ? const Color(0xFF774331)
        : const Color(0xFFE0E0E0);
  }

  Widget _buildContent(BuildContext context, WidgetRef ref) {
    switch (message.type) {
      case MessageType.text:
        return Text(
          message.text!,
          style: TextStyle(
            color: message.sender == MessageSender.user
                ? Colors.white
                : Colors.black,
          ),
        );
      case MessageType.recipe:
        return RecipeCard(
          recipe: message.recipe!,
          onRecipePersisted: (persisted) {
            ref
                .read(chatControllerProvider.notifier)
                .replaceRecipeAt(messageIndex, persisted);
          },
        );
    }
  }
}
