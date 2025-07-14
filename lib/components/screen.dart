import 'package:flutter/material.dart';
import 'package:matrix_calculator/components/input_field.dart';
import 'package:matrix_calculator/models/matrix.dart';


class Screen extends StatelessWidget{
  final double width;
  final double height;
  final Matrix matrixInfo;
  final Function(Matrix) onMatrixChanged;

  const Screen({
    super.key,
    required this.width,
    required this.height,
    required this.matrixInfo,
    required this.onMatrixChanged,
  });

  @override
  Widget build(BuildContext ctx){
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
        child: InputField()
      ),
    );
  }
}


