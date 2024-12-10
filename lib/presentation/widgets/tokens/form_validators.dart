import 'package:clario/core/templates/context_extensions.dart';
import 'package:flutter/material.dart';

import '../moleculs/input_field_widget.dart';

typedef FieldValidationFunction = FieldValidationResult Function(BuildContext, String?);

class FormValidators {
  static final _emailRegexp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}');
  static final _passwordRegexp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$');

  static FieldValidationFunction emailValidator = (context, value) {
    if (value == null || value.isEmpty) {
      return (state: FieldState.error, errorMessage: context.s.email_field_cant_be_empty);
    }
    if (!_emailRegexp.hasMatch(value)) {
      return (state: FieldState.error, errorMessage: context.s.invalid_email_address);
    }
    return (state: FieldState.success, errorMessage: null);
  };

  static FieldValidationFunction passwordValidator = (context, value) {
    if (value == null || value.isEmpty) {
      return (state: FieldState.error, errorMessage: context.s.password_field_cant_be_empty);
    }
    if (!_passwordRegexp.hasMatch(value)) {
      return (state: FieldState.error, errorMessage: context.s.invalid_password);
    }
    return (state: FieldState.success, errorMessage: null);
  };
}
