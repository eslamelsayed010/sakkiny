import 'package:sakkiny/features/home/data/models/home_model/property.dart';

abstract class SelectStates {}

class InitialSelectPropertyState extends SelectStates {}

class LoadingSelectPropertyStates extends SelectStates {}

class SuccessSelectPropertyStates extends SelectStates {
  final Property property;
  SuccessSelectPropertyStates(this.property);
}

class FailureSelectPropertyStates extends SelectStates {
  final String error;
  FailureSelectPropertyStates(this.error);
}
