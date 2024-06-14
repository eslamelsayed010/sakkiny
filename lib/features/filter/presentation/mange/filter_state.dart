import 'package:sakkiny/features/search/data/models/search_model/property.dart';

abstract class FilterStates {}

class InitialFilterState extends FilterStates {}

class LoadingFilterState extends FilterStates {}

class SuccessFilterState extends FilterStates {
  final List<Property> result;
  SuccessFilterState(this.result);
}

class FailureFilterState extends FilterStates {
  final String error;
  FailureFilterState(this.error);
}
