import 'package:flutter/material.dart';
import 'package:flutter_text_ocr/home/camera.dart';
import 'package:flutter_text_ocr/home/gallery.dart';

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
