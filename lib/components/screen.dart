import 'package:flutter/material.dart';
import 'package:matrix_calculator/components/input_field.dart';

class Screen extends StatelessWidget {
  final List<List<TextEditingController>> controllers;
  final List<List<String>> labels;
  final void Function(int row, int col)? onFieldFocus;

  const Screen({
    super.key,
    required this.controllers,
    required this.labels,
    this.onFieldFocus,
  });

  @override
  Widget build(BuildContext ctx) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(controllers.length, (rowIdx) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(controllers[rowIdx].length, (colIdx) {
              return SizedBox(
                width: 90,
                child: _FocusableInputField(
                  controller: controllers[rowIdx][colIdx],
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  label: labels[rowIdx][colIdx],
                  onFocus: () {
                    if (onFieldFocus != null) {
                      onFieldFocus!(rowIdx, colIdx);
                    }
                  },
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}

// Helper widget to manage FocusNode and callback
class _FocusableInputField extends StatefulWidget {
  final TextEditingController controller;
  final EdgeInsetsGeometry? margin;
  final String? label;
  final VoidCallback? onFocus;

  const _FocusableInputField({
    required this.controller,
    this.margin,
    this.label,
    this.onFocus,
  });

  @override
  State<_FocusableInputField> createState() => _FocusableInputFieldState();
}

class _FocusableInputFieldState extends State<_FocusableInputField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocus);
  }

  void _handleFocus() {
    if (_focusNode.hasFocus && widget.onFocus != null) {
      widget.onFocus!();
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocus);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InputField(
      controller: widget.controller,
      margin: widget.margin,
      label: widget.label,
      focusNode: _focusNode,
    );
  }
}


