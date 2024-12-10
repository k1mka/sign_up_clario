import 'package:flutter/material.dart';

abstract class Palette {
  static const white = Color(0xFFFFFFFF);
  static const lightBlack = Color(0xFF4A4E71);
  static const initBorderColor = Color(0xFF6F91BC);
  static const lightGreen = Color(0xFF27B274);
  static const errorColor = Color(0xFFFF8080);
  static const pinkColor = Color(0xFFFDEFEE);
  static const redColor = Color(0xFFED5F59);
}

abstract class Gradients {
  static const background = LinearGradient(
    colors: [
      Color(0xFFF4F9FF),
      Color(0xFFE0EDFB),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
