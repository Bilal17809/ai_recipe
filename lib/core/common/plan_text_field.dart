import 'package:flutter/material.dart';

class PlainTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const PlainTextInput({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
      minLines: 1,
      maxLines: 4,
      style: const TextStyle(fontSize: 16),
    );
  }
}
