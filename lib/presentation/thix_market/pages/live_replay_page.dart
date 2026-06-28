import 'package:flutter/material.dart';
import 'package:thix_id/presentation/thix_market/widgets/live/replay_list.dart';

class LiveReplayPage extends StatelessWidget {
  const LiveReplayPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    appBar: AppBar(title: Text('Replays')),
    body: ReplayList(),
  );
}
