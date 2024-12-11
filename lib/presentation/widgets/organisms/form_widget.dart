import 'package:clario/core/templates/context_extensions.dart';
import 'package:clario/core/theme/text_styles.dart';
import 'package:clario/presentation/widgets/atoms/gradient_button.dart';
import 'package:clario/presentation/widgets/moleculs/input_field_widget.dart';
import 'package:clario/presentation/widgets/tokens/form_validators.dart';
import 'package:clario/presentation/widgets/tokens/spacings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FormWidget extends HookWidget {
  const FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers and focus nodes
    final emailController = useTextEditingController();
    final passController = useTextEditingController();

    final emailFocusNode = useFocusNode();
    final passFocusNode = useFocusNode();

    // State management for field validation
    final emailErrorMessage = useState<String?>(null);
    final passErrorMessage = useState<String?>(null);

    final emailFieldState = useState<FieldState>(FieldState.initial);
    final passFieldState = useState<FieldState>(FieldState.initial);

    void validateField({
      required String value,
      required FieldValidationFunction validator,
      required ValueNotifier<FieldState> fieldStateNotifier,
      required ValueNotifier<String?> errorMessageNotifier,
      required BuildContext context,
    }) {
      final result = validator(context, value);
      fieldStateNotifier.value = result.state;
      errorMessageNotifier.value = result.errorMessage;
    }

    void validateAll(BuildContext context) {
      validateField(
        value: emailController.text,
        validator: FormValidators.emailValidator,
        fieldStateNotifier: emailFieldState,
        errorMessageNotifier: emailErrorMessage,
        context: context,
      );

      validateField(
        value: passController.text,
        validator: FormValidators.passwordValidator,
        fieldStateNotifier: passFieldState,
        errorMessageNotifier: passErrorMessage,
        context: context,
      );
    }

    return Column(
      children: [
        Spacings.spacer64,
        Text(
          context.s.sign_up,
          style: TextStyles.signUpTextStyle,
        ),
        Spacings.spacer40,
        InputFieldWidget.email(
          hintText: context.s.email,
          node: emailFocusNode,
          controller: emailController,
          fieldState: emailFieldState.value,
          errorMessage: emailErrorMessage.value,
        ),
        Spacings.spacer20,
        InputFieldWidget.password(
          hintText: context.s.create_your_password,
          node: passFocusNode,
          controller: passController,
          fieldState: passFieldState.value,
          errorMessage: passErrorMessage.value,
        ),
        Spacings.spacer40,
        GradientButton(
          text: context.s.sign_up,
          onPressed: () => validateAll(context),
        ),
      ],
    );
  }
}
