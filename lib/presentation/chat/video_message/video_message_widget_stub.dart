// lib/presentation/chat/video_message/video_message_widget_stub.dart
// Web-safe stub: video capture/preview not supported without dart:io.

import 'package:flutter/material.dart';

class VideoMessageWidget extends StatelessWidget {
  final void Function(dynamic videoFile, int durationSeconds) onVideoRecorded;

  const VideoMessageWidget({super.key, required this.onVideoRecorded});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Message vidéo')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.videocam_off_outlined, size: 40),
              const SizedBox(height: 12),
              const Text('L\'envoi de vidéos n\'est pas disponible sur le Web pour le moment.'),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Fermer')),
            ],
          ),
        ),
      ),
    );
  }
}
