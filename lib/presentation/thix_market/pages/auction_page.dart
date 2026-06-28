import 'package:flutter/material.dart';
import 'package:thix_id/presentation/thix_market/widgets/live/live_auction_widget.dart';

class AuctionPage extends StatelessWidget {
  final String sessionId;

  const AuctionPage({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Enchères')),
    body: LiveAuctionWidget(sessionId: sessionId),
  );
}
