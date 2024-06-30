import 'package:sakkiny/features/services/data/models/get_service_model/get_service_model.dart';

abstract class ChangeFavoriteServiceState {}

class InitialChangeFavoriteServiceState extends ChangeFavoriteServiceState {}

class ChangeColorFavoriteServiceState extends ChangeFavoriteServiceState {}

class SuccessChangeFavoriteServiceState extends ChangeFavoriteServiceState {
  final GetServiceModel  changeFavoriteServiceModel;
  SuccessChangeFavoriteServiceState(this.changeFavoriteServiceModel);
}

class FailureChangeFavoriteServiceState extends ChangeFavoriteServiceState {
  final String error;
  FailureChangeFavoriteServiceState(this.error);
}
