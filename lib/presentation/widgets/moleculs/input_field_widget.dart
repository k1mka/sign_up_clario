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

  @override
  Widget build(BuildContext context) {
    final isError = fieldState == FieldState.error;
    final isSuccess = fieldState == FieldState.success;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          focusNode: node,
          cursorColor: isError ? Colors.red : (isSuccess ? Colors.green : Colors.grey),
          style: TextStyle(
            color: isError ? Colors.red : (isSuccess ? Colors.green : Colors.black),
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: isError ? Colors.red : Colors.grey,
            ),
            filled: true,
            fillColor: isError
                ? Colors.red.withOpacity(0.1)
                : (isSuccess ? Colors.green.withOpacity(0.1) : Colors.white),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
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
