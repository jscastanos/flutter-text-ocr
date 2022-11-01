import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyText extends StatefulWidget {
  const CopyText({super.key, required this.text});
  final String text;

  @override
  State<CopyText> createState() => _CopyTextState();
}

class _CopyTextState extends State<CopyText> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: const Text('Copy'),
      icon: const Icon(
        Icons.copy_all,
        size: 30,
      ),
      onPressed: () {
        Clipboard.setData(ClipboardData(text: widget.text));
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Copied to clipboard')));
      },
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
    );
  }
}
