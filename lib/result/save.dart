import 'package:flutter/material.dart';

class SaveText extends StatefulWidget {
  const SaveText({super.key});

  @override
  State<SaveText> createState() => _SaveTextState();
}

class _SaveTextState extends State<SaveText> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: const Text('Save'),
      icon: const Icon(
        Icons.save_as,
        size: 30,
      ),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
    );
  }
}
