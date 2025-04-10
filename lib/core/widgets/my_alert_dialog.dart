import 'package:flutter/material.dart';
import 'package:rikaz/core/widgets/my_button.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onOk,
  });
  final String title;
  final String content;
  final Function() onOk;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        MyButton(text: "Yes", onPressed: onOk),
      ],
    );
  }
}
