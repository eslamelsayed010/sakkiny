import 'package:sakkiny/features/add/data/models/add_property_model/add_property_model.dart';

abstract class AddPropertyState {}

class AddPropertyInitial extends AddPropertyState {}

class AddPropertySuccess extends AddPropertyState {
  final AddPropertyModel addPropertyModel;

  AddPropertySuccess({required this.addPropertyModel});
}

class AddPropertyLoading extends AddPropertyState {}

class AddPropertyFailure extends AddPropertyState {
  final String error;

  AddPropertyFailure({required this.error});
}
