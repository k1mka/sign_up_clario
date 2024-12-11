import 'package:clario/presentation/widgets/moleculs/input_field_widget.dart';
import 'package:clario/presentation/widgets/tokens/form_validators.dart';
import 'package:flutter/material.dart';

class SignUpLayout extends StatefulWidget {
  const SignUpLayout({super.key});

  @override
  State<SignUpLayout> createState() => _SignUpLayoutState();
}

class _SignUpLayoutState extends State<SignUpLayout> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  FieldState _emailFieldState = FieldState.initial;
  String? _emailErrorMessage;

  void _validateEmail() {
    final result = FormValidators.emailValidator(context, _emailController.text);
    setState(() {
      _emailFieldState = result.state;
      _emailErrorMessage = result.errorMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputFieldWidget(
                hintText: 'Email',
                controller: _emailController,
                node: _emailFocusNode,
                fieldState: _emailFieldState,
                errorMessage: _emailErrorMessage,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _validateEmail,
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
