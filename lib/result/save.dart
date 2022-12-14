import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class SaveText extends StatefulWidget {
  const SaveText({super.key, required this.text});
  final String text;

  @override
  State<SaveText> createState() => _SaveTextState();
}

class _SaveTextState extends State<SaveText> {
  String fileName = '';

  String getNow() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm:ss');
    String formattedDate = formatter.format(now);

    return formattedDate;
  }

  Future getFilePath() async {
    String? externalStorageDirPath;

    // TODO: add support for IOS
    // Android only
    final Directory? externalStorage = await getExternalStorageDirectory();
    externalStorageDirPath = externalStorage!.path;
    String now = getNow();

    String name = 'text-ocr-$now.txt';
    String filePath = '$externalStorageDirPath/$name';

    setState(() {
      fileName = filePath;
    });

    return filePath;
  }

  Future<void> saveFile() async {
    File file = File(await getFilePath());
    file.writeAsString(widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.save_as,
        size: 30,
      ),
      label: const Text('Save'),
      onPressed: () async {
        await saveFile();
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$fileName is saved successfully')));
      },
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
    );
  }
}
