// lib/presentation/chat/voice/voice_recorder_widget_stub.dart
// Web-safe stub.

import 'package:flutter/material.dart';

class VoiceRecorderWidget extends StatelessWidget {
  final void Function(dynamic file, int durationSeconds) onVoiceRecorded;

  const VoiceRecorderWidget({super.key, required this.onVoiceRecorded});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.mic_off_outlined, size: 36),
            const SizedBox(height: 10),
            const Text('Enregistrement audio non disponible sur le Web.'),
          ],
        ),
      ),
    );
  }
}
