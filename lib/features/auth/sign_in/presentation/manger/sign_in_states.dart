import 'package:sakkiny/features/auth/sign_in/data/models/auth_model/auth_model.dart';

abstract class SignInStates {}

class InitialSignInState extends SignInStates {}

class LoadingSignInState extends SignInStates {}

class SuccessSignInState extends SignInStates {
  final AuthModel authModel;
  SuccessSignInState(this.authModel);
}

class FailureSignInState extends SignInStates {
  final String error;
  FailureSignInState(this.error);
}
