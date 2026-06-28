import 'package:flutter/material.dart';
import 'package:thix_id/presentation/thix_market/widgets/products/product_comparator.dart';

class ProductComparatorPage extends StatelessWidget {
  final List<String>? initialProductIds;

  const ProductComparatorPage({super.key, this.initialProductIds});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Comparer')),
    body: ProductComparator(initialProductIds: initialProductIds),
  );
}
