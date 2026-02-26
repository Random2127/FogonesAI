import 'package:flutter/material.dart';
import 'package:fogonesia/features/recipe/widgets/recipe_card.dart';
import 'package:fogonesia/shared/chat_message.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;
  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
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
        child: _buildContent(context),
      ),
    );
  }

  Color _bubbleColour(bool isUser) {
    if (message.type == MessageType.recipe) {
      return Colors.transparent;
    }
    return isUser
        ? const Color.fromARGB(255, 14, 64, 150)
        : const Color(0xFFE0E0E0);
  }

  Widget _buildContent(BuildContext context) {
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
        return RecipeCard(recipe: message.recipe!);
    }
  }
}
