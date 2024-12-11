import 'package:clario/core/templates/context_extensions.dart';
import 'package:clario/core/theme/text_styles.dart';
import 'package:clario/gen/assets.gen.dart';
import 'package:clario/presentation/widgets/atoms/background_widget.dart';
import 'package:clario/presentation/widgets/atoms/gradient_button.dart';
import 'package:clario/presentation/widgets/organisms/form_widget.dart';
import 'package:clario/presentation/widgets/tokens/spacings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:clario/presentation/widgets/moleculs/input_field_widget.dart';
import 'package:clario/presentation/widgets/tokens/form_validators.dart';

class SignUpLayout extends HookWidget {
  const SignUpLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BackgroundWidget(
          backgroundAsset: Assets.images.png.background.path,
          child: const Padding(
            padding: Spacings.paddingH30,
            child: FormWidget(),
          ),
        ),
      ),
    );
  }
}
