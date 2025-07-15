import 'package:flutter/material.dart';
import 'package:matrix_calculator/components/screen.dart';
import 'package:matrix_calculator/components/screen_controls.dart';
import 'package:matrix_calculator/models/matrix.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const int maxRows = 4;
  static const int maxCols = 4;
  int rowCount = 1;
  int colCount = 1;
  List<List<TextEditingController>> controllers = [
    [TextEditingController()]
  ];

  Matrix matrixInfo = Matrix(
    name: "Matrix",
    row: 1,
    col: 1,
    data: [[0]]
  );

  final FocusNode _bgFocusNode = FocusNode();

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
    _bgFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: null,
        automaticallyImplyLeading: false,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          _bgFocusNode.requestFocus();
        },
        child: Focus(
          focusNode: _bgFocusNode,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.zero,
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Screen(
                    controllers: controllers,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: screenControls(
          400 * .8, 60,
          onAdd: colCount < maxCols ? addInputField : null,
          onRemove: colCount > 1 ? removeInputField : null,
          onAddRow: rowCount < maxRows ? addRow : null,
          onRemoveRow: rowCount > 1 ? removeRow : null,
        ),
      ),
    );
  }
}