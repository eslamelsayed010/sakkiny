import 'package:sakkiny/features/auth/sign_in/data/models/auth_model/auth_model.dart';

abstract class RegisterStates {}

class InitialRegisterStates extends RegisterStates {}

class LoadingRegisterStates extends RegisterStates {}

class SuccessRegisterStates extends RegisterStates {
  final AuthModel authModel;
  SuccessRegisterStates(this.authModel);
}

class FailureRegisterStates extends RegisterStates {
  final String error;
  FailureRegisterStates(this.error);
}
