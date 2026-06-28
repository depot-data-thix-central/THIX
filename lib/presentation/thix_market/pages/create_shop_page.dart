import 'package:flutter/material.dart';
import 'package:thix_id/presentation/thix_market/widgets/shops/create_shop_form.dart';

class CreateShopPage extends StatelessWidget {
  const CreateShopPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    appBar: AppBar(title: Text('Créer une boutique')),
    body: SafeArea(child: SingleChildScrollView(padding: EdgeInsets.all(16), child: CreateShopForm())),
  );
}
