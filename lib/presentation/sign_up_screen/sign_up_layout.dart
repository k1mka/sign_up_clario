import 'package:clario/core/templates/context_extensions.dart';
import 'package:clario/core/theme/text_styles.dart';
import 'package:clario/gen/assets.gen.dart';
import 'package:clario/presentation/widgets/atoms/background_widget.dart';
import 'package:clario/presentation/widgets/atoms/gradient_button.dart';
import 'package:clario/presentation/widgets/moleculs/input_field_widget.dart';
import 'package:clario/presentation/widgets/tokens/form_validators.dart';
import 'package:clario/presentation/widgets/tokens/spacings.dart';
import 'package:flutter/material.dart';

class SignUpLayout extends StatefulWidget {
  const SignUpLayout({super.key});

  @override
  State<SignUpLayout> createState() => _SignUpLayoutState();
}

class _SignUpLayoutState extends State<SignUpLayout> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        emailFocusNode.unfocus();
      },
      child: Scaffold(
        body: BackgroundWidget(
          backgroundAsset: Assets.images.png.background.path,
          child: Center(
            child: Padding(
              padding: Spacings.paddingH30,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Text(
                      context.s.sign_up,
                      style: TextStyles.signUpTextStyle,
                    ),
                    const SizedBox(height: 40),
                    InputFieldWidget(
                      hintText: 'Email',
                      validator: FormValidators.emailValidator,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 20),
                    GradientButton(
                      text: context.s.sign_up,
                      onPressed: () {
                        final result = FormValidators.emailValidator(context, _emailController.text);
                        if (result.state == FieldState.success) {
                          print('Email is valid: ${_emailController.text}');
                        } else {
                          print('Error: ${result.errorMessage}');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
