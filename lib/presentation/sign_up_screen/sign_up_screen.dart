import 'package:clario/presentation/sign_up_screen/cubit/auth_cubit.dart';
import 'package:clario/presentation/sign_up_screen/sign_up_layout.dart';
import 'package:clario/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const routeName = '/SignUpScreen';

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => AuthCubit(getRepo),
        child: SignUpLayout(),
      );
}
