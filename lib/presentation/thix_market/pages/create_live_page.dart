import 'package:flutter/material.dart';
import 'package:thix_id/presentation/thix_market/widgets/live/create_live_form.dart';

class CreateLivePage extends StatelessWidget {
  const CreateLivePage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    appBar: AppBar(title: Text('Créer un live')),
    body: SafeArea(child: SingleChildScrollView(padding: EdgeInsets.all(16), child: CreateLiveForm())),
  );
}
