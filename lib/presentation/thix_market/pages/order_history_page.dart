import 'package:flutter/material.dart';
import 'package:thix_id/presentation/thix_market/widgets/common/empty_state.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    appBar: AppBar(title: Text('Historique des commandes')),
    body: EmptyState(
      title: 'Aucune commande',
      message: 'Vos commandes apparaîtront ici.',
      icon: Icons.receipt_long,
    ),
  );
}
