import 'package:sakkiny/features/verify/data/model/verify_identity.dart';

abstract class VerifyStates {}

class InitialVerifyState extends VerifyStates {}

class LoadingVerifyState extends VerifyStates {}

class SuccessVerifyState extends VerifyStates {
  final VerifyIdentityModel verifyIdentityModel;
  SuccessVerifyState(this.verifyIdentityModel);
}

class FailureVerifyState extends VerifyStates {
  final String error;
  FailureVerifyState(this.error);
}
