import 'package:flutter/material.dart';
import 'package:thix_id/presentation/thix_market/widgets/common/empty_state.dart';

class EditAnnouncementPage extends StatelessWidget {
  final String announcementId;

  const EditAnnouncementPage({super.key, required this.announcementId});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Modifier l\'annonce')),
    body: EmptyState(
      title: 'Annonce $announcementId',
      message: 'Édition non disponible dans cette version.',
      icon: Icons.edit_note,
    ),
  );
}
