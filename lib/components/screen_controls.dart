import 'package:flutter/material.dart';

Widget screenControls(
  double width,
  double height, {
  VoidCallback? onAdd,
  VoidCallback? onRemove,
  VoidCallback? onAddRow,
  VoidCallback? onRemoveRow,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.transparent,
      border: Border.all(color: Colors.black, width: 2),
      borderRadius: BorderRadius.circular(16),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Up button (centered)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: onRemoveRow,
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                side: const BorderSide(color: Colors.black, width: 2),
                padding: const EdgeInsets.all(8),
              ),
              child: const Icon(Icons.keyboard_arrow_up, color: Colors.black),
            ),
          ],
        ),
        // Left, Down, Right buttons (in a row)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: onRemove,
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                side: const BorderSide(color: Colors.black, width: 2),
                padding: const EdgeInsets.all(8),
              ),
              child: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            OutlinedButton(
              onPressed: onAddRow,
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                side: const BorderSide(color: Colors.black, width: 2),
                padding: const EdgeInsets.all(8),
              ),
              child: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
            ),
            OutlinedButton(
              onPressed: onAdd,
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                side: const BorderSide(color: Colors.black, width: 2),
                padding: const EdgeInsets.all(8),
              ),
              child: const Icon(Icons.keyboard_arrow_right, color: Colors.black),
            ),
          ],
        ),
      ],
    ),
  );
}