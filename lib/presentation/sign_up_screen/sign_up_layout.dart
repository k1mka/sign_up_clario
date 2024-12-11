import 'package:clario/core/templates/context_extensions.dart';
import 'package:clario/gen/assets.gen.dart';
import 'package:clario/presentation/widgets/atoms/background_widget.dart';
import 'package:clario/presentation/widgets/atoms/gradient_button.dart';
import 'package:clario/presentation/widgets/tokens/spacings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:clario/presentation/widgets/moleculs/input_field_widget.dart';
import 'package:clario/presentation/widgets/tokens/form_validators.dart';

class SignUpLayout extends HookWidget {
  const SignUpLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers and focus nodes
    final emailController = useTextEditingController();
    final passController = useTextEditingController();
    final emailFocusNode = useFocusNode();
    final passFocusNode = useFocusNode();

    // State management for field validation
    final emailErrorMessage = useState<String?>(null);
    final emailFieldState = useState<FieldState>(FieldState.initial);
    final passErrorMessage = useState<String?>(null);
    final passFieldState = useState<FieldState>(FieldState.initial);

    // Validation functions
    void validateEmail() {
      final result = FormValidators.emailValidator(context, emailController.text);
      emailFieldState.value = result.state;
      emailErrorMessage.value = result.errorMessage;
    }

    void validatePassword() {
      final result = FormValidators.passwordValidator(context, passController.text);
      passFieldState.value = result.state;
      passErrorMessage.value = result.errorMessage;
    }

    void validateAll() {
      validateEmail();
      validatePassword();
    }

    return Scaffold(
      body: Center(
        child: BackgroundWidget(
          backgroundAsset: Assets.images.png.background.path,
          child: Padding(
            padding: Spacings.paddingH30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputFieldWidget.email(
                  hintText: 'Email',
                  node: emailFocusNode,
                  controller: emailController,
                  fieldState: emailFieldState.value,
                  errorMessage: emailErrorMessage.value,
                ),
                Spacings.spacer20,
                InputFieldWidget.password(
                  hintText: 'Create your password',
                  node: passFocusNode,
                  controller: passController,
                  fieldState: passFieldState.value,
                  errorMessage: passErrorMessage.value,
                ),
                Spacings.spacer40,
                GradientButton(
                  text: context.s.sign_up,
                  onPressed: validateAll,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
