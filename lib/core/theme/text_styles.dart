import 'package:clario/core/theme/palette.dart';
import 'package:clario/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
  static TextStyle get signUpTextStyle => const TextStyle(
        fontSize: 28,
        color: Palette.lightBlack,
        fontFamily: FontFamily.inter,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get hintTextStyle => const TextStyle(
        fontSize: 16,
        color: Palette.lightGreen,
        fontFamily: FontFamily.inter,
        fontWeight: FontWeight.w400,
      );
}
