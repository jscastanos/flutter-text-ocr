import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key, required this.picture});

  final XFile picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.65,
            child: Image.file(File(picture.path), fit: BoxFit.fill),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.close,
                          size: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('Discard'),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.search,
                          size: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('OCR'),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    ));
  }
}
