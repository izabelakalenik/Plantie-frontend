import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showImageSourceSelector(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a photo'),
              onTap: () {
                Navigator.of(context).pop();
                openCamera(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from gallery'),
              onTap: () {
                Navigator.of(context).pop();
                pickFromGallery(context);
              },
            ),
          ],
        ),
      );
    },
  );
}

void openCamera(BuildContext context) {
  imageHandler(ImageSource.camera, context);
}
void pickFromGallery(BuildContext context) {
  imageHandler(ImageSource.gallery, context);
}

Future<void> imageHandler(ImageSource source, BuildContext context) async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: source);

  if (image != null) {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Selected image: ${image.name}')),
    );
  }

}

