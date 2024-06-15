import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

abstract class SelectServiceStates {}

class InitialSelectServiceState extends SelectServiceStates {}

class LoadingSelectServiceStates extends SelectServiceStates {}

class SuccessSelectServiceStates extends SelectServiceStates {
  final Service service;
  SuccessSelectServiceStates(this.service);
}

class FailureSelectServiceStates extends SelectServiceStates {
  final String error;
  FailureSelectServiceStates(this.error);
}
