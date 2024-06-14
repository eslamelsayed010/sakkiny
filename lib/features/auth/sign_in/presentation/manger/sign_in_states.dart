import 'package:sakkiny/features/auth/sign_in/data/models/user_model/user_model.dart';

abstract class SignInStates {}

class InitialSignInState extends SignInStates {}

class LoadingSignInState extends SignInStates {}

class SuccessSignInState extends SignInStates {
  final UserModel userModel;
  SuccessSignInState(this.userModel);
}

class FailureSignInState extends SignInStates {
  final String error;
  FailureSignInState(this.error);
}
