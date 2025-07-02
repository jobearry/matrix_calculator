import 'package:flutter/material.dart';

Container inputField() {
  return Container(
      margin: EdgeInsets.all(24),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Enter text',
          border: OutlineInputBorder(),
        ),
      ),
    );
}