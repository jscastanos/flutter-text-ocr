import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../preview.dart';

class GalleryButton extends StatefulWidget {
  const GalleryButton({super.key});

  @override
  State<GalleryButton> createState() => _GalleryButtonState();
}

class _GalleryButtonState extends State<GalleryButton> {
  final ImagePicker _picker = ImagePicker();

  Future pickImage() async {
    try {
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (!mounted) return;
      if (image?.name == '') return;

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PreviewScreen(file: image as XFile)));
    } on PlatformException catch (e) {
      debugPrint('Error occured while selecting a picture $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        await pickImage();
      },
      icon: const Icon(
        Icons.photo_library,
        size: 30,
      ),
      label: const Text('Gallery'),
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
    );
  }
}
