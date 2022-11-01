import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_ocr/home/home.dart';
import 'package:flutter_text_ocr/result/result.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key, required this.file});
  final XFile file;

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
            child: Image.file(File(file.path), fit: BoxFit.fill),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    label: const Text('Discard'),
                    icon: const Icon(
                      Icons.close,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                          (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10)),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  OCRButton(file: file)
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

class OCRButton extends StatefulWidget {
  final XFile file;
  const OCRButton({super.key, required this.file});

  @override
  State<OCRButton> createState() => _OCRButtonState();
}

class _OCRButtonState extends State<OCRButton> {
  final TextRecognizer _textRecognizer = TextRecognizer();
  bool _isBusy = false;
  late InputImage inputImage;

  @override
  void dispose() async {
    _textRecognizer.close();
    _isBusy = false;
    super.dispose();
  }

  Future<String> processImage({required XFile file}) async {
    if (_isBusy) return '';
    if (file.path == '') return '';

    inputImage = InputImage.fromFilePath(file.path);

    setState(() {
      _isBusy = true;
    });

    final recognizedText = await _textRecognizer.processImage(inputImage);

    setState(() {
      _isBusy = false;
    });
    return recognizedText.text;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: _isBusy
          ? const SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 1.5,
              ))
          : const Icon(
              Icons.search,
              size: 30,
            ),
      label: Text(_isBusy ? 'Processing' : 'OCR'),
      style: ElevatedButton.styleFrom(
          backgroundColor: _isBusy ? Colors.grey : Colors.blue,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () async {
        if (_isBusy) return;
        await processImage(file: widget.file).then(
          (result) => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultScreen(text: result))),
        );
      },
    );
  }
}
