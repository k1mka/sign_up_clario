sealed class AuthStates {}

class InitialAuthState extends AuthStates {}

class LoadingAuthState extends AuthStates {}

class SuccessAuthState extends AuthStates {}

class ErrorAuthStateState extends AuthStates {
  ErrorAuthStateState(this.exception);

  final Object exception;
}
