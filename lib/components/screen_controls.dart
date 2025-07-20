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
        // Operations Section
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: null, // To be implemented
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  side: const BorderSide(color: Colors.black, width: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Icon(Icons.add, color: Colors.black),
              ),
              SizedBox(width: 12),
              OutlinedButton(
                onPressed: null, // To be implemented
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  side: const BorderSide(color: Colors.black, width: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Icon(Icons.remove, color: Colors.black),
              ),
              SizedBox(width: 12),
              OutlinedButton(
                onPressed: null, // To be implemented
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  side: const BorderSide(color: Colors.black, width: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Icon(Icons.clear, color: Colors.black), // multiplication
              ),
              // Divider before clear button
              SizedBox(width: 16),
              Container(
                height: 32,
                child: VerticalDivider(
                  color: Colors.black,
                  thickness: 1.2,
                  width: 1,
                ),
              ),
              SizedBox(width: 16),
              OutlinedButton(
                onPressed: null, // To be implemented
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  side: const BorderSide(color: Colors.black, width: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                ),
                child: const Text('C', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
              ),
            ],
          ),
        ),
        // Divider between sections
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Divider(
            color: Colors.black,
            thickness: 1.2,
            height: 1,
          ),
        ),
        // Dimension Control Section and Equals Button
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // D-pad layout for directional buttons
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Up button
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
                // Left, (spacer), Right buttons
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
                    SizedBox(width: 32),
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
                // Down button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: onAddRow,
                      style: OutlinedButton.styleFrom(
                        shape: const CircleBorder(),
                        side: const BorderSide(color: Colors.black, width: 2),
                        padding: const EdgeInsets.all(8),
                      ),
                      child: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            // Spacing between D-pad and equals button
            SizedBox(width: 24),
            // Large equals button
            OutlinedButton(
              onPressed: null, // To be implemented
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: const BorderSide(color: Colors.black, width: 2),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
                minimumSize: const Size(64, 120),
              ),
              child: const Icon(Icons.drag_handle, color: Colors.black, size: 40), // equals
            ),
          ],
        ),
      ],
    ),
  );
}