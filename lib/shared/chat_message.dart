import 'package:fogonesia/features/recipe/model/recipe.dart';

enum MessageSender { user, ai }

enum MessageType { text, recipe }

class ChatMessage {
  final String? text;
  final Recipe? recipe;
  final MessageSender sender;
  final MessageType type;

  ChatMessage.text(this.text, this.sender)
    : type = MessageType.text,
      recipe = null;
  ChatMessage.recipe(this.recipe, this.sender)
    : type = MessageType.recipe,
      text = null;
}
