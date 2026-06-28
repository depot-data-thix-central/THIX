import 'package:flutter/material.dart';
import 'package:thix_id/presentation/thix_market/widgets/shops/manage_shop_widget.dart';

class ManageShopPage extends StatelessWidget {
  final String shopId;

  const ManageShopPage({super.key, required this.shopId});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Gérer la boutique')),
    body: ManageShopWidget(shopId: shopId),
  );
}
