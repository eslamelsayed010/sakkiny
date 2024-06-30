import 'package:sakkiny/features/home/data/models/home_model/home_model.dart';

abstract class ChangeFavoriteState {}

class InitialChangeFavoriteState extends ChangeFavoriteState {}

class ChangeColorFavoriteState extends ChangeFavoriteState {}

class SuccessChangeFavoriteState extends ChangeFavoriteState {
  final HomeModel  changeFavoriteModel;
  SuccessChangeFavoriteState(this.changeFavoriteModel);
}

class FailureChangeFavoriteState extends ChangeFavoriteState {
  final String error;
  FailureChangeFavoriteState(this.error);
}
