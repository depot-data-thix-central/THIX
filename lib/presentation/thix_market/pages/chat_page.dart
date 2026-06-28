import 'package:flutter/material.dart';
import 'package:thix_id/presentation/thix_market/widgets/common/empty_state.dart';

class ChatPage extends StatelessWidget {
  final String? conversationId;

  const ChatPage({super.key, this.conversationId});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Chat')),
    body: EmptyState(
      title: conversationId == null ? 'Chat' : 'Conversation $conversationId',
      message: 'Page chat Market non implémentée.',
      icon: Icons.chat_bubble_outline,
    ),
  );
}
