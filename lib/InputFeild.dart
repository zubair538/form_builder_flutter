import 'package:flutter/material.dart';

InputDecoration InputStyle(label, {hint = '', radius = 25.0}) {
  return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      labelText: label,
      hintText: hint);
}

