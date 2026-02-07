import 'package:flutter/material.dart';
import 'package:fogonesia/controllers/chat_controller.dart';
import 'package:fogonesia/controllers/dietary_controller.dart';
import 'package:fogonesia/widgets/components/chat_bubble.dart';
import 'package:fogonesia/widgets/components/input_bar.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _send(BuildContext context) {
    final message = _controller.text.trim();
    if (message.isEmpty) return;
    final dietaryOptions = context.read<DietaryController>().options;
    context.read<ChatController>().sendMessage(message, dietaryOptions);
    _controller.clear();

    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Consumer<ChatController>(
              builder: (context, chat, child) {
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: chat.messages.length + (chat.isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == chat.messages.length) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    return ChatBubble(message: chat.messages[index]);
                  },
                );
              },
            ),
          ),
          InputBar(controller: _controller, onSend: () => _send(context)),
        ],
      ),
    );
  }
}
