import 'package:clario/core/theme/palette.dart';
import 'package:clario/core/theme/text_styles.dart';
import 'package:clario/gen/assets.gen.dart';
import 'package:clario/presentation/widgets/tokens/spacings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum FieldType { email, password }

enum FieldState { initial, error, success }

typedef FieldValidationResult = ({FieldState state, String? errorMessage});

class InputFieldWidget extends HookWidget {
  const InputFieldWidget._({
    required this.fieldType,
    required this.hintText,
    required this.fieldState,
    this.errorMessage,
    this.controller,
    this.node,
  });

  factory InputFieldWidget.email({
    required String hintText,
    required FieldState fieldState,
    String? errorMessage,
    TextEditingController? controller,
    FocusNode? node,
  }) {
    return InputFieldWidget._(
      fieldType: FieldType.email,
      hintText: hintText,
      fieldState: fieldState,
      errorMessage: errorMessage,
      controller: controller,
      node: node,
    );
  }

  factory InputFieldWidget.password({
    required String hintText,
    required FieldState fieldState,
    String? errorMessage,
    TextEditingController? controller,
    FocusNode? node,
  }) {
    return InputFieldWidget._(
      fieldType: FieldType.password,
      hintText: hintText,
      fieldState: fieldState,
      errorMessage: errorMessage,
      controller: controller,
      node: node,
    );
  }

  final String hintText;
  final FieldState fieldState;
  final FieldType fieldType;
  final String? errorMessage;
  final FocusNode? node;
  final TextEditingController? controller;

  static const _filled = true;
  static const _fieldHeight = 48.0;
  static const _defaultBorder = 1.0;
  static const _cursorHeight = 17.0;
  static const _cursorWidth = 2.0;
  static const _customIconPadding = EdgeInsets.only(right: 20);
  static const _emptyPlug = SizedBox.shrink();
  static const _contentPadding = EdgeInsets.symmetric(vertical: 14, horizontal: 20);

  bool get isPasswordField => fieldType == FieldType.password;

  @override
  Widget build(BuildContext context) {
    final obscureText = useState(true);

    final suffixAsset =
        obscureText.value ? Assets.images.svg.hidePassword : Assets.images.svg.showPassword;

    void togglePasswordVisibility() => obscureText.value = !obscureText.value;

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
            obscureText: isPasswordField && obscureText.value,
            cursorColor: stateColor,
            style: TextStyles.inputTextStyle.copyWith(color: stateColor),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyles.inputTextStyle.copyWith(color: hintColor),
              filled: _filled,
              fillColor: fillColor,
              suffixIcon: GestureDetector(
                onTap: togglePasswordVisibility,
                child: isPasswordField
                    ? Padding(
                        padding: _customIconPadding,
                        child: SvgPicture.asset(
                          suffixAsset,
                          colorFilter: ColorFilter.mode(stateColor, BlendMode.srcIn),
                        ),
                      )
                    : _emptyPlug,
              ),
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
        /*  if (isError && errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              errorMessage!,
              style: const TextStyle(color: Colors.red, fontSize: 12.0),
            ),
          ),*/
      ],
    );
  }
}
