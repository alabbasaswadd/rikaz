import 'package:flutter/material.dart';
import 'package:rikaz/core/constants/colors.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {super.key,
      required this.label,
      this.onChanged,
      this.controller,
      this.obscureText,
      this.keyBoard = TextInputType.text,
      this.validate});
  final String label;
  final bool? obscureText;
  final Function(String value)? onChanged;
  final String? Function(String?)? validate;
  final TextEditingController? controller;
  final TextInputType keyBoard;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: TextFormField(
          validator: validate,
          keyboardType: keyBoard,
          obscureText: obscureText ?? false,
          controller: controller,
          onChanged: onChanged,
          cursorColor: AppColor.kPrimaryColor,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.kPrimaryColor),
            ),
            border: OutlineInputBorder(),
            labelText: label,
            labelStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
