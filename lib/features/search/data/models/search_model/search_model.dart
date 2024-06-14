import 'property.dart';

class SearchModel {
  String? message;
  List<Property>? properties;

  SearchModel({this.message, this.properties});

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
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
