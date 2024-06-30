import 'package:sakkiny/features/verify/data/model/send_code_model.dart';

abstract class SendStates {}

class InitialSendState extends SendStates {}

class LoadingSendState extends SendStates {}

class SuccessSendState extends SendStates {
  final SendCodeModel sendCodeModel;
  SuccessSendState(this.sendCodeModel);
}

class FailureSendState extends SendStates {
  final String error;
  FailureSendState(this.error);
}
