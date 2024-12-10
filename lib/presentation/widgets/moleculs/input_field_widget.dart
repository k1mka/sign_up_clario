import 'package:clario/core/theme/palette.dart';
import 'package:clario/gen/fonts.gen.dart';
import 'package:clario/presentation/widgets/tokens/form_validators.dart';
import 'package:clario/presentation/widgets/tokens/spacings.dart';
import 'package:flutter/material.dart';

enum FieldState {
  initial,
  error,
  success,
}

typedef FieldValidationResult = ({FieldState state, String? errorMessage});

class InputFieldWidget extends StatefulWidget {
  const InputFieldWidget({
    super.key,
    required this.hintText,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.node,
    this.onChanged,
  });

  final String hintText;
  final FocusNode? node;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final FieldValidationFunction? validator;
  final ValueChanged<String>? onChanged;

  @override
  State<InputFieldWidget> createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  FieldState _fieldState = FieldState.initial;
  String? _errorMessage;

  void _validateField(String value) {
    if (widget.validator != null) {
      final result = widget.validator!(context, value);
      setState(() {
        _fieldState = result.state;
        _errorMessage = result.errorMessage;
      });
    }
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isError = _fieldState == FieldState.error;
    final isSuccess = _fieldState == FieldState.success;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          focusNode: widget.node,
          onChanged: _validateField,
          cursorColor: isError ? Colors.red : (isSuccess ? Colors.green : Colors.grey),
          style: TextStyle(
            color: isError ? Colors.red : (isSuccess ? Colors.green : Colors.black),
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: isError ? Colors.red : Colors.grey,
            ),
            filled: true,
            fillColor: isError
                ? Colors.red.withOpacity(0.1)
                : (isSuccess ? Colors.green.withOpacity(0.1) : Colors.white),
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: isError ? Colors.red : (isSuccess ? Colors.green : Colors.grey),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: isError ? Colors.red : (isSuccess ? Colors.green : Colors.black),
                width: 2.0,
              ),
            ),
          ),
        ),
        if (isError && _errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              _errorMessage!,
              style: const TextStyle(color: Colors.red, fontSize: 12.0),
            ),
          ),
      ],
    );
  }
}
