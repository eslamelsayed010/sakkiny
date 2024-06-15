import 'property.dart';

class AddPropertyModel {
  bool? status;
  String? message;
  Property? property;

  AddPropertyModel({this.status, this.message, this.property});

  factory AddPropertyModel.fromJson(Map<String, dynamic> json) {
    return AddPropertyModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      property: json['property'] == null
          ? null
          : Property.fromJson(json['property'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'property': property?.toJson(),
      };
}
