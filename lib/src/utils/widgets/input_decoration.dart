import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      Widget? prefix,
      Colors? color}) {
    return InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        prefixIcon: prefix);
  }
}