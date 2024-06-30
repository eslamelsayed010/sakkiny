import 'package:sakkiny/features/services/data/models/get_service_model/get_service_model.dart';

abstract class FavServiceStates {}

class InitialFetchFavoriteServiceState extends FavServiceStates {}

class LoadingFetchFavoriteServiceState extends FavServiceStates {}

class SuccessFetchFavoriteServiceState extends FavServiceStates {
  final GetServiceModel favServiceModel;
  SuccessFetchFavoriteServiceState(this.favServiceModel);
}

class FailureFetchFavoriteServiceState extends FavServiceStates {
  final String error;
  FailureFetchFavoriteServiceState(this.error);
}
