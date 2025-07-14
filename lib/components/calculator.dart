import 'package:flutter/material.dart';
import 'package:matrix_calculator/components/screen.dart';
import 'package:matrix_calculator/components/screen_controls.dart';
import 'package:matrix_calculator/models/matrix.dart';

class Calculator extends StatelessWidget{ 
  final double width;
  final double height;
  final Matrix matrixInfo;
  final Function(Matrix) onMatrixChanged;

  const Calculator({
    super.key,
    required this.width,
    required this.height,
    required this.matrixInfo,
    required this.onMatrixChanged,
  });

  @override
  Widget build(BuildContext ctx){
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Screen(
        width: width, 
        height: height, 
        matrixInfo:  matrixInfo, 
        onMatrixChanged: onMatrixChanged,
      ),
      SizedBox(height: 10), // 
      screenControls(width, 60)
    ],
  );
  }
}

