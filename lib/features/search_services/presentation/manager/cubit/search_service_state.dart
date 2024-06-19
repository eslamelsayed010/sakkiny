import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

abstract class SearchServiceStates {}

class InitialSearchServiceState extends SearchServiceStates {}

class LoadingSearchServiceState extends SearchServiceStates {}

class SuccessSearchServiceState extends SearchServiceStates {
  final List<Service> result;
  SuccessSearchServiceState(this.result);
}

class FailureSearchServiceState extends SearchServiceStates {
  final String error;
  FailureSearchServiceState(this.error);
}
