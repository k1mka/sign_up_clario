import 'package:clario/core/theme/palette.dart';
import 'package:clario/core/theme/text_styles.dart';
import 'package:clario/presentation/widgets/moleculs/input_field_widget.dart';
import 'package:clario/presentation/widgets/tokens/form_validators.dart';
import 'package:flutter/material.dart';

class RequirementItem {
  final String text;
  final bool isMet;

  RequirementItem({
    required this.text,
    required this.isMet,
  });
}

class RequirementListWidget extends StatelessWidget {
  const RequirementListWidget({
    super.key,
    required this.controller,
    required this.fieldState,
  });

  final FieldState fieldState;
  final TextEditingController controller;

  static const _padding = EdgeInsets.only(bottom: 4);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, child) {
        final requirements = FormValidators.passwordRequirementsValidator(context, value.text);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: requirements.map((requirement) {
            final textColor = switch (fieldState) {
              FieldState.error => requirement.isMet ? Palette.lightGreen : Palette.errorColor,
              FieldState.success => Colors.green,
              FieldState.initial => Palette.lightBlack,
            };
            return Padding(
              padding: _padding,
              child: Text(
                requirement.text,
                style: TextStyles.descriptionStyle.copyWith(color: textColor),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
