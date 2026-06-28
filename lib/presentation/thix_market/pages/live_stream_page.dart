import 'package:flutter/material.dart';
import 'package:thix_id/presentation/thix_market/widgets/live/live_stream_player.dart';

class LiveStreamPage extends StatelessWidget {
  final String sessionId;

  const LiveStreamPage({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Live')),
    body: LiveStreamPlayer(sessionId: sessionId),
  );
}
