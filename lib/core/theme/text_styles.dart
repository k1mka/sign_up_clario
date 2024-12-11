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

  static TextStyle get inputTextStyle => const TextStyle(
        color: Palette.lightBlack,
        fontSize: 16,
        fontFamily: FontFamily.inter,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get descriptionStyle => const TextStyle(
        fontSize: 13.0,
        fontFamily: FontFamily.inter,
        fontWeight: FontWeight.w400,
        color: Palette.white,
      );
}
