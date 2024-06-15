import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

abstract class ServiceStates {}

class InitialServiceState extends ServiceStates {}

class LoadingServiceState extends ServiceStates {}

class SuccessServiceState extends ServiceStates {
  final List<Service> service;
  SuccessServiceState(this.service);
}

class FailureServiceState extends ServiceStates {
  final String error;
  FailureServiceState(this.error);
}
