import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final bool isPass;
  const InputField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.isPass = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        hintText: hintText,
      ),
      controller: controller,
      obscureText: isPass,
    );
  }
}
