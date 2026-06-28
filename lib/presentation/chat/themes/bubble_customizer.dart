import 'package:flutter/material.dart';

class BubbleCustomizer extends StatelessWidget {
  const BubbleCustomizer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Bubble customizer')),
      body: Center(child: Text('Not implemented yet.', style: theme.textTheme.bodyMedium)),
    );
  }
}
