import 'package:flutter/material.dart';
import 'package:matrix_calculator/components/calculator.dart';
import 'package:matrix_calculator/models/matrix.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Matrix matrixInfo = Matrix(
    name: "Matrix", 
    row: 1, 
    col: 1, 
    data: [[0]]
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Center(
          child: Calculator(
            width: 400 * .8,
            height: 600 * .6,
            matrixInfo: matrixInfo,
            onMatrixChanged: (Matrix newMatrix) {
              setState(() {
                matrixInfo = newMatrix;
              });
            },
          )
        ) 
      ),
    );
  }
}