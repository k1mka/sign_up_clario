import 'package:clario/core/theme/palette.dart';
import 'package:clario/core/theme/text_styles.dart';
import 'package:clario/presentation/widgets/atoms/validation_widget.dart';
import 'package:clario/presentation/widgets/moleculs/input_field_widget.dart';
import 'package:flutter/material.dart';

class ErrorHelperWidget extends StatelessWidget {
  const ErrorHelperWidget({
    super.key,
    required this.isPasswordField,
    required this.controller,
    required this.fieldState,
    required this.errorMessage,
    required this.isEmailField,
  });

  final String? errorMessage;

  final bool isEmailField;
  final bool isPasswordField;
  final FieldState fieldState;
  final TextEditingController controller;

  static const _padding = EdgeInsets.only(top: 8, left: 20);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isPasswordField)
          Padding(
            padding: _padding,
            child: RequirementListWidget(
              controller: controller,
              fieldState: fieldState,
            ),
          ),
        if (isEmailField && errorMessage != null)
          Padding(
            padding: _padding,
            child: Text(
              errorMessage!,
              style: TextStyles.descriptionStyle.copyWith(color: Palette.errorColor),
            ),
          ),
      ],
    );
  }
}
