import 'package:flutter/material.dart';
import 'package:matrix_calculator/components/screen.dart';
import 'package:matrix_calculator/components/screen_controls.dart';
import 'package:matrix_calculator/models/matrix.dart';

class Calculator extends StatefulWidget {
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
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  List<TextEditingController> controllers = [TextEditingController()];

  void addInputField() {
    if (controllers.length >= 4) return;
    setState(() {
      controllers.add(TextEditingController());
    });
  }

  void removeInputField() {
    if (controllers.length <= 1) return;
    setState(() {
      controllers.removeLast();
    });
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Screen(
          controllers: controllers,
        ),
        const SizedBox(height: 10),
        screenControls(
          widget.width, 60,
          onAdd: controllers.length < 4 ? addInputField : null,
          onRemove: controllers.length > 1 ? removeInputField : null,
        ),
      ],
    );
  }
}

