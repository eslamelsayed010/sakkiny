import 'package:sakkiny/features/user/data/models/update_user_model/update_user_model.dart';

abstract class UpdateUserStates {}

class UpdateUserStatesInitial extends UpdateUserStates {}

class UpdateUserStatesLoading extends UpdateUserStates {}

class UpdateUserStatesSuccess extends UpdateUserStates {
  final UpdateUserModel userModelInfo;
  UpdateUserStatesSuccess(this.userModelInfo);
}

class UpdateUserStatesFailure extends UpdateUserStates {
  final String error;
  UpdateUserStatesFailure(this.error);
}
