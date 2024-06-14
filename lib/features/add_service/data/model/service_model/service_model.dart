import 'service.dart';

class ServiceModel {
  String? message;
  Service? service;

  ServiceModel({this.message, this.service});

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        message: json['message'] as String?,
        service: json['service'] == null
            ? null
            : Service.fromJson(json['service'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'service': service?.toJson(),
      };
}
