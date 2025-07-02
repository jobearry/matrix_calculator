import 'package:flutter/material.dart';
import 'package:matrix_calculator/components/input_field.dart';

Container screen(double width, double height) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 182, 182, 181),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(2, 2),
        ),
      ],
    ),
    child: Center(
      child: inputField()
    ),
  );
}

