// lib/presentation/chat/widgets/attachment_picker.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class AttachmentPicker {
  static Future<XFile?> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    return picked;
  }

  static Future<XFile?> pickVideo() async {
    final picker = ImagePicker();
    final picked = await picker.pickVideo(source: ImageSource.gallery);
    return picked;
  }

  static Future<PlatformFile?> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    return result?.files.single;
  }

  static void showPickerSheet(BuildContext context, void Function(XFile file) onSelected) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Image'),
              onTap: () async {
                final file = await pickImage();
                if (file != null) onSelected(file);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.videocam),
              title: const Text('Vidéo'),
              onTap: () async {
                final file = await pickVideo();
                if (file != null) onSelected(file);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.insert_drive_file),
              title: const Text('Fichier'),
              onTap: () async {
                await pickFile();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
