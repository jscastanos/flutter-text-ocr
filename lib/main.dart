import 'package:flutter/material.dart';
import 'package:flutter_ml/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Text OCR',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Text OCR'),
          ),
          body: const HomeScreen(),
        ));
  }
}
