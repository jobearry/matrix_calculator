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

  final FocusNode _bgFocusNode = FocusNode();

  @override
  void dispose() {
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
        toolbarHeight: 80,
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
          child: Stack(
            children: [
              // Main content
              Center(
                child: Calculator(
                  width: 400 * .8,
                  height: 600 * .6,
                  matrixInfo: matrixInfo,
                  onMatrixChanged: (Matrix newMatrix) {
                    setState(() {
                      matrixInfo = newMatrix;
                    });
                  },
                ),
              ),
              // Floating modern title
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Card(
                    elevation: 0,
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}