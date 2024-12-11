import 'package:clario/core/theme/palette.dart';
import 'package:clario/core/theme/text_styles.dart';
import 'package:clario/presentation/widgets/tokens/spacings.dart';
import 'package:flutter/material.dart';

enum FieldState {
  initial,
  error,
  success,
}

typedef FieldValidationResult = ({FieldState state, String? errorMessage});

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({
    super.key,
    required this.hintText,
    required this.fieldState,
    this.errorMessage,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.node,
  });

  final String hintText;
  final FieldState fieldState;
  final String? errorMessage;
  final FocusNode? node;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  static const _filled = true;
  static const _fieldHeight = 48.0;
  static const _defaultBorder = 1.0;
  static const _cursorHeight = 17.0;
  static const _cursorWidth = 2.0;
  static const _contentPadding = EdgeInsets.symmetric(vertical: 12, horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final isError = fieldState == FieldState.error;

    final stateColor = switch (fieldState) {
      FieldState.error => Palette.errorColor,
      FieldState.success => Palette.lightGreen,
      FieldState.initial => Palette.lightBlack,
    };

    final enabledBorderColor = switch (fieldState) {
      FieldState.error => Palette.errorColor,
      FieldState.success => Palette.lightGreen,
      FieldState.initial => Colors.transparent,
    };

    final focusBorderColor = switch (fieldState) {
      FieldState.error => Palette.errorColor,
      FieldState.success => Palette.lightGreen,
      FieldState.initial => Palette.initBorderColor,
    };

    final hintColor = isError ? Palette.errorColor : Palette.initBorderColor;
    final fillColor = isError ? Palette.pinkColor : Colors.white;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _fieldHeight,
          child: TextFormField(
            cursorHeight: _cursorHeight,
            cursorWidth: _cursorWidth,
            focusNode: node,
            controller: controller,
            cursorColor: stateColor,
            style: TextStyles.inputTextStyle.copyWith(color: stateColor),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyles.inputTextStyle.copyWith(color: hintColor),
              filled: _filled,
              fillColor: fillColor,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              contentPadding: _contentPadding,
              enabledBorder: OutlineInputBorder(
                borderRadius: Spacings.borderRadius10,
                borderSide: BorderSide(color: enabledBorderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: Spacings.borderRadius10,
                borderSide: BorderSide(color: focusBorderColor, width: _defaultBorder),
              ),
            ),
          ),
        ),
        if (isError && errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              errorMessage!,
              style: const TextStyle(color: Colors.red, fontSize: 12.0),
            ),
          ),
      ],
    );
  }
}
