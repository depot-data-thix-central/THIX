import 'package:flutter/material.dart';
import 'package:thix_id/presentation/thix_market/widgets/common/empty_state.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    appBar: AppBar(title: Text('Notifications')),
    body: EmptyState(
      title: 'Aucune notification',
      message: 'Les notifications Market apparaîtront ici.',
      icon: Icons.notifications_none,
    ),
  );
}
