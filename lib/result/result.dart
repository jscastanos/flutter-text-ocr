import 'package:flutter/material.dart';
import 'package:flutter_text_ocr/result/copy.dart';
import 'package:flutter_text_ocr/result/save.dart';

import '../home/home.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.text});
  final String text;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false);
            },
          ),
          title: const Text("Back"),
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Container(
                color: Colors.grey.shade100,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SelectableText(widget.text),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CopyText(text: widget.text),
                    const SizedBox(
                      width: 25,
                    ),
                    const SaveText()
                  ],
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            )
          ],
        )));
  }
}
