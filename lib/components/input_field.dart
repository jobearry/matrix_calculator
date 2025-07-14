import 'package:flutter/material.dart';

class InputField extends StatelessWidget{
  const InputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            children: const [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter text',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}