import 'package:sakkiny/features/home/data/models/home_model/property.dart';

abstract class SearchStates {}

class InitialSearchState extends SearchStates {}

class LoadingSearchState extends SearchStates {}

class SuccessSearchState extends SearchStates {
  final List<Property> result;
  SuccessSearchState(this.result);
}

class FailureSearchState extends SearchStates {
  final String error;
  FailureSearchState(this.error);
}
