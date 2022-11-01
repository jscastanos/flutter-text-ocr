import 'package:flutter/material.dart';

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
          children: const [CameraButton(), GalleryButton()],
        )
      ],
    ));
  }
}

class CameraButton extends StatefulWidget {
  const CameraButton({super.key});

  @override
  State<CameraButton> createState() => _CameraButtonState();
}

class _CameraButtonState extends State<CameraButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(
            Icons.photo_camera,
            size: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text('Camera'),
          )
        ],
      ),
    );
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
            size: 20,
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
