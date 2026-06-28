import 'package:flutter/material.dart';
import 'package:thix_id/presentation/thix_market/widgets/selling/publish_announcement_form.dart';

class PublishAnnouncementPage extends StatelessWidget {
  const PublishAnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    appBar: AppBar(title: Text('Publier une annonce')),
    body: SafeArea(child: SingleChildScrollView(padding: EdgeInsets.all(16), child: PublishAnnouncementForm())),
  );
}
