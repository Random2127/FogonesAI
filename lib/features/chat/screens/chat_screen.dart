import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Consumer;
import 'package:fogonesia/features/chat/controller/chat_controller.dart';
import 'package:fogonesia/features/dietary/controller/dietary_controller.dart';
import 'package:fogonesia/shared/widgets/chat_bubble.dart';
import 'package:fogonesia/shared/widgets/input_bar.dart';
import 'package:provider/provider.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _send(BuildContext context) {
    final message = _controller.text.trim();
    if (message.isEmpty) return;

    final dietaryOptions = ref.read(dietaryControllerProvider);
    context.read<ChatController>().sendMessage(message, dietaryOptions);
    _controller.clear();

    // Schedule the scroll to happen immediately after the widget tree updates
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
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
