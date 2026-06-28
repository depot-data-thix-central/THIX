import 'package:flutter/material.dart';
import 'package:thix_id/presentation/thix_market/widgets/shops/shop_statistics.dart';

class ShopStatisticsPage extends StatelessWidget {
  final String shopId;

  const ShopStatisticsPage({super.key, required this.shopId});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Statistiques')),
    body: ShopStatistics(shopId: shopId),
  );
}
