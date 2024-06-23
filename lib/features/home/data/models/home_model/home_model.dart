import 'property.dart';

class HomeModel {
  bool? status;
  String? message;
  List<Property>? properties;

  HomeModel({this.status, this.message, this.properties});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        properties: (json['properties'] as List<dynamic>?)
            ?.map((e) => Property.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'properties': properties?.map((e) => e.toJson()).toList(),
      };
}
