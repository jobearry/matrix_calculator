import 'package:flutter/material.dart';
import 'package:matrix_calculator/components/input_field.dart';

class Screen extends StatelessWidget {
  final List<List<TextEditingController>> controllers;

  const Screen({
    super.key,
    required this.controllers,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: controllers
            .map((row) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: row
                      .map((controller) => SizedBox(
                            width: 90,
                            child: InputField(
                              controller: controller,
                              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                            ),
                          ))
                      .toList(),
                ))
            .toList(),
      ),
    );
  }
}


