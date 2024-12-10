import 'package:clario/domain/repository.dart';
import 'package:clario/presentation/sign_up_screen/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this.repository) : super(InitialAuthState());

  final Repository repository;

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    emit(LoadingAuthState());

    try {
      emit(SuccessAuthState());
    } catch (e) {
      print(e);
    }
  }

  void logout() {
    emit(InitialAuthState());
  }
}
