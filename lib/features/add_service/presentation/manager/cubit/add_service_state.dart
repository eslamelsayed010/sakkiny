import 'package:sakkiny/features/add_service/data/model/service_model/service_model.dart';

abstract class AddServiceState {}

class AddServiceInitial extends AddServiceState {}

class AddServiceSuccess extends AddServiceState {
  final ServiceModel serviceModel;

  AddServiceSuccess({required this.serviceModel});
}

class AddServiceLoading extends AddServiceState {}

class AddServiceFailure extends AddServiceState {
  final String error;

  AddServiceFailure({required this.error});
}
