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
  List<List<String>> labels = [
    ['']
  ];
  int focusedRow = 0;
  int focusedCol = 0;

  void addInputField() {
    if (colCount >= maxCols) return;
    setState(() {
      colCount++;
      for (var i = 0; i < controllers.length; i++) {
        controllers[i].add(TextEditingController());
        labels[i].add('');
      }
    });
  }

  void removeInputField() {
    if (colCount <= 1) return;
    setState(() {
      colCount--;
      for (var i = 0; i < controllers.length; i++) {
        controllers[i].removeLast();
        labels[i].removeLast();
      }
    });
  }

  void addRow() {
    if (rowCount >= maxRows) return;
    setState(() {
      rowCount++;
      controllers.add(List.generate(colCount, (_) => TextEditingController()));
      labels.add(List.generate(colCount, (_) => ''));
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
      labels.removeLast();
    });
  }

  void handleOperationPressed() {
    setState(() {
      for (int i = 0; i < controllers.length; i++) {
        for (int j = 0; j < controllers[i].length; j++) {
          final value = controllers[i][j].text;
          if (value.isNotEmpty && value != '0') {
            labels[i][j] = value;
            controllers[i][j].text = '0';
          }
        }
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
          labels: labels,
          onFieldFocus: (row, col) {
            setState(() {
              focusedRow = row;
              focusedCol = col;
            });
          },
        ),
        const SizedBox(height: 10),
        screenControls(
          widget.width, 60,
          onAdd: colCount < maxCols ? addInputField : null,
          onRemove: colCount > 1 ? removeInputField : null,
          onAddRow: rowCount < maxRows ? addRow : null,
          onRemoveRow: rowCount > 1 ? removeRow : null,
          onOperationPressed: handleOperationPressed,
        ),
      ],
    );
  }
}

