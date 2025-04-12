import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<void> openCamera(BuildContext context) async {
  final ImagePicker picker = ImagePicker();
  final XFile? photo = await picker.pickImage(source: ImageSource.camera);

  if (photo != null) {
    // Do something with the photo (e.g., show it, send it to backend)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Photo captured: ${photo.name}')),
    );
  }
}