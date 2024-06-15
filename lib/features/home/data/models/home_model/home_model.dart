import 'property.dart';

class HomeModel {
  String? message;
  List<Property>? properties;

  HomeModel({this.message, this.properties});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        message: json['message'] as String?,
        properties: (json['properties'] as List<dynamic>?)
            ?.map((e) => Property.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'properties': properties?.map((e) => e.toJson()).toList(),
      };
}
