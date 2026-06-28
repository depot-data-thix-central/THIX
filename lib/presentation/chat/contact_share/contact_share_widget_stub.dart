// lib/presentation/chat/contact_share/contact_share_widget_stub.dart
// Web-safe stub.

import 'package:flutter/material.dart';

class ContactShareWidget extends StatelessWidget {
  final void Function(Map<String, String> contactData) onContactSelected;

  const ContactShareWidget({super.key, required this.onContactSelected});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Partage de contact', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Non disponible sur le Web pour le moment.'),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Fermer')),
          ],
        ),
      ),
    );
  }
}
