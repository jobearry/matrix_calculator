import 'package:flutter/material.dart';
import 'package:matrix_calculator/components/screen.dart';
import 'package:matrix_calculator/components/screen_controls.dart';

Column calculator(double width, double height) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      screen(width, height),
      SizedBox(height: 10), // 
      screenControls(width, 60)
    ],
  );
}

