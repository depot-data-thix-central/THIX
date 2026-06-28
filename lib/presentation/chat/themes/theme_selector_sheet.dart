import 'package:flutter/material.dart';

/// Placeholder sheet to keep routing compiling.
///
/// TODO: Replace with real theme selection UI.
class ThemeSelectorSheet extends StatelessWidget {
  const ThemeSelectorSheet({super.key});

  static Future<void> show(BuildContext context) => showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    builder: (_) => const ThemeSelectorSheet(),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Theme selector', style: theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Not implemented yet.', style: theme.textTheme.bodyMedium),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
