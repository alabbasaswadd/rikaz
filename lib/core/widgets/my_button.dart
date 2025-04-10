import 'package:flutter/material.dart';
import 'package:rikaz/core/constants/colors.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key, required this.text, required this.onPressed, this.color});
  final String text;
  final Function() onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: MaterialButton(
        color: color ?? AppColor.kPrimaryColor,
        textColor: AppColor.kWhiteColor,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
