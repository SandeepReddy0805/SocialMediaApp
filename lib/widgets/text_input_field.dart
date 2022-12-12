import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPass;
  final TextInputType inputType;
  const TextInputField(
      {super.key,
      required this.hintText,
      this.isPass = false,
      required this.controller,
      required this.inputType});

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: inputBorder,
          focusedBorder: inputBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(8)),
      keyboardType: inputType,
      obscureText: isPass,
    );
  }
}
