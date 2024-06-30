import 'package:sakkiny/features/home/data/models/user_model/user_model.dart';

abstract class UserStates {}

class InitialUserState extends UserStates {}

class LoadingUserState extends UserStates {}

class SuccessUserState extends UserStates {
  final UserModel userModel;
  SuccessUserState(this.userModel);
}

class FailureUserState extends UserStates {
  final String error;
  FailureUserState(this.error);
}
