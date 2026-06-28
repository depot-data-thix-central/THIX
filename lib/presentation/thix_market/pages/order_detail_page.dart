import 'package:flutter/material.dart';
import 'package:thix_id/presentation/thix_market/widgets/common/empty_state.dart';

class OrderDetailPage extends StatelessWidget {
  final String orderId;

  const OrderDetailPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Détail commande')),
    body: EmptyState(
      title: 'Commande $orderId',
      message: 'Détails non disponibles dans cette version.',
      icon: Icons.local_shipping_outlined,
    ),
  );
}
