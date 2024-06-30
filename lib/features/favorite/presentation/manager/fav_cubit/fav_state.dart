import 'package:sakkiny/features/home/data/models/home_model/home_model.dart';

abstract class FavStates {}

class InitialFetchFavoriteState extends FavStates {}

class LoadingFetchFavoriteState extends FavStates {}

class SuccessFetchFavoriteState extends FavStates {
  final HomeModel favModel;
  SuccessFetchFavoriteState(this.favModel);
}

class FailureFetchFavoriteState extends FavStates {
  final String error;
  FailureFetchFavoriteState(this.error);
}
