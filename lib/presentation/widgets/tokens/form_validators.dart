import 'package:clario/core/templates/context_extensions.dart';
import 'package:clario/presentation/widgets/moleculs/input_field_widget.dart';
import 'package:flutter/material.dart';

import '../atoms/validation_widget.dart';

typedef SingleRegistrationValidatorFunction = String? Function(BuildContext, String?);
typedef FieldValidationFunction = FieldValidationResult Function(BuildContext, String?);
typedef RequirementValidator = List<RequirementItem> Function(BuildContext context, String value);

class FormValidators {
  static final _emailRegexp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}');
  static final _uppercaseLowercaseRegexp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])');
  static final _digitRegexp = RegExp(r'\d');

  /// Validation logic for email field
  static FieldValidationFunction emailValidator = (context, value) {
    if (value == null || value.isEmpty) {
      return (state: FieldState.error, errorMessage: context.s.email_field_cant_be_empty);
    }
    if (!_emailRegexp.hasMatch(value)) {
      return (state: FieldState.error, errorMessage: context.s.invalid_email_address);
    }
    return (state: FieldState.success, errorMessage: null);
  };

  /// Validation logic for password field
  static FieldValidationFunction passwordValidator = (context, value) {
    if (value == null || value.isEmpty) {
      return (state: FieldState.error, errorMessage: context.s.password_field_cant_be_empty);
    }
    if (value.length < 8 || value.contains(' ')) {
      return (state: FieldState.error, errorMessage: context.s.eight_characters);
    }
    if (!_uppercaseLowercaseRegexp.hasMatch(value)) {
      return (state: FieldState.error, errorMessage: context.s.uppercase_and_lowercase_letters);
    }
    if (!_digitRegexp.hasMatch(value)) {
      return (state: FieldState.error, errorMessage: context.s.at_least_one_digit);
    }
    return (state: FieldState.success, errorMessage: null);
  };

  /// Password requirements validator with localization
  static RequirementValidator passwordRequirementsValidator = (context, value) {
    return [
      RequirementItem(
        text: context.s.eight_characters,
        isMet: value.length >= 8 && !value.contains(' '),
      ),
      RequirementItem(
        text: context.s.uppercase_and_lowercase_letters,
        isMet: _uppercaseLowercaseRegexp.hasMatch(value),
      ),
      RequirementItem(
        text: context.s.at_least_one_digit,
        isMet: _digitRegexp.hasMatch(value),
      ),
    ];
  };

  /// Email requirements validator with localization
  static RequirementValidator emailRequirementsValidator = (context, value) {
    return [
      RequirementItem(
        text: context.s.email_field_cant_be_empty,
        isMet: value.isNotEmpty,
      ),
      RequirementItem(
        text: context.s.invalid_email_address,
        isMet: _emailRegexp.hasMatch(value),
      ),
    ];
  };
}
