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
  static const int maxRows = 4;
  static const int maxCols = 4;
  int rowCount = 1;
  int colCount = 1;
  List<List<TextEditingController>> controllers = [
    [TextEditingController()]
  ];

  void addInputField() {
    if (colCount >= maxCols) return;
    setState(() {
      colCount++;
      for (var row in controllers) {
        row.add(TextEditingController());
      }
    });
  }

  void removeInputField() {
    if (colCount <= 1) return;
    setState(() {
      colCount--;
      for (var row in controllers) {
        row.removeLast();
      }
    });
  }

  void addRow() {
    if (rowCount >= maxRows) return;
    setState(() {
      rowCount++;
      controllers.add(List.generate(colCount, (_) => TextEditingController()));
    });
  }

  void removeRow() {
    if (rowCount <= 1) return;
    setState(() {
      rowCount--;
      var removed = controllers.removeLast();
      for (var c in removed) {
        c.dispose();
      }
    });
  }

  @override
  void dispose() {
    for (var row in controllers) {
      for (var c in row) {
        c.dispose();
      }
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
          onAdd: colCount < maxCols ? addInputField : null,
          onRemove: colCount > 1 ? removeInputField : null,
          onAddRow: rowCount < maxRows ? addRow : null,
          onRemoveRow: rowCount > 1 ? removeRow : null,
        ),
      ],
    );
  }
}

