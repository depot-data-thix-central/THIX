import 'package:flutter/material.dart';
import 'package:thix_id/presentation/thix_market/widgets/products/product_detail.dart';

class ProductDetailPage extends StatelessWidget {
  final String productId;
  final Map<String, dynamic>? initialProduct;

  const ProductDetailPage({super.key, required this.productId, this.initialProduct});

  @override
  Widget build(BuildContext context) => ProductDetail(productId: productId, initialProduct: initialProduct);
}
