import 'package:fogonesia/models/recipe.dart';

enum MessageSender { user, ai }

enum MessageType { text, recipe }

// maybe add timestamp
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
