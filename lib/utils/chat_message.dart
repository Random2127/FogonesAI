enum MessageSender { user, ai }

class ChatMessage {
  final String text;
  final MessageSender sender;

  ChatMessage(this.text, this.sender);
}
