import 'package:flutter/material.dart';
import 'package:thix_id/presentation/thix_market/widgets/products/price_alert.dart';

class PriceAlertsPage extends StatelessWidget {
  const PriceAlertsPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    appBar: AppBar(title: Text('Alertes de prix')),
    body: PriceAlert(),
  );
}
