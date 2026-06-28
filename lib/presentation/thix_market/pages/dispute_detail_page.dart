import 'package:flutter/material.dart';
import 'package:thix_id/presentation/thix_market/widgets/common/empty_state.dart';

class DisputeDetailPage extends StatelessWidget {
  final String disputeId;

  const DisputeDetailPage({super.key, required this.disputeId});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Litige')),
    body: EmptyState(
      title: 'Litige $disputeId',
      message: 'Détails non disponibles dans cette version.',
      icon: Icons.gavel_outlined,
    ),
  );
}
