import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  final String title;
  final String content;
  final VoidCallback onOkPressed;

  const CustomAlertDialog({
    required this.title,
    required this.content,
    required this.onOkPressed,
  });

  @override
  State createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Text(
        widget.content,
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Tamam"),
        ),
      ],
    );
  }
}
