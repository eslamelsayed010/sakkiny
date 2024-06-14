import 'package:sakkiny/features/home/data/models/home_model/property.dart';

abstract class RecommendedStates {}

class InitialRecommendedState extends RecommendedStates {}

class LoadingRecommendedState extends RecommendedStates {}

class SuccessRecommendedState extends RecommendedStates {
  final List<Property> properties;
  SuccessRecommendedState(this.properties);
}

class FailureRecommendedState extends RecommendedStates {
  final String error;
  FailureRecommendedState(this.error);
}
