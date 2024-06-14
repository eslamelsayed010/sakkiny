import 'package:sakkiny/features/home/data/models/home_model/property.dart';

abstract class PropertyStates {}

class InitialPropertyState extends PropertyStates {}

class LoadingPropertyState extends PropertyStates {}

class SuccessPropertyState extends PropertyStates {
  final List<Property> properties;
  SuccessPropertyState(this.properties);
}

class FailurePropertyState extends PropertyStates {
  final String error;
  FailurePropertyState(this.error);
}
