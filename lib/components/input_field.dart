import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final EdgeInsetsGeometry? margin;

  const InputField({
    super.key,
    this.controller,
    this.obscureText = false,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        padding: const EdgeInsets.all(6.0),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.blue),
            ),
            contentPadding: EdgeInsets.zero,
            filled: false, // No background
          ),
        ),
      ),
    );
  }
}