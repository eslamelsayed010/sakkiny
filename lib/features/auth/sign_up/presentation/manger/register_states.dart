import 'package:sakkiny/features/auth/sign_in/data/models/user_model/user_model.dart';

abstract class RegisterStates {}

class InitialRegisterStates extends RegisterStates {}

class LoadingRegisterStates extends RegisterStates {}

class SuccessRegisterStates extends RegisterStates {
  final UserModel userModel;
  SuccessRegisterStates(this.userModel);
}

class FailureRegisterStates extends RegisterStates {
  final String error;
  FailureRegisterStates(this.error);
}
