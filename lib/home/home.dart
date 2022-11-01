import 'package:flutter/material.dart';
import 'package:flutter_text_ocr/home/camera.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 250,
            ),
            const SizedBox(height: 20),
            const CameraButton(),
            const SizedBox(height: 15),
            const GalleryButton()
          ],
        )
      ],
    ))));
  }
}

class GalleryButton extends StatefulWidget {
  const GalleryButton({super.key});

  @override
  State<GalleryButton> createState() => _GalleryButtonState();
}

class _GalleryButtonState extends State<GalleryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
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
