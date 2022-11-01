import 'package:flutter/material.dart';
import 'package:flutter_text_ocr/home/camera.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
            const SizedBox(
              height: 20,
            ),
            const CameraButton(),
            const GalleryButton()
          ],
        )
      ],
    ));
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
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(
            Icons.photo_library,
            size: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text('Gallery'),
          )
        ],
      ),
    );
  }
}
