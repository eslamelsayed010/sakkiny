import 'service.dart';

class Searchservicemodel {
  String? message;
  List<Service>? services;

  Searchservicemodel({this.message, this.services});

  factory Searchservicemodel.fromJson(Map<String, dynamic> json) {
    return Searchservicemodel(
      message: json['message'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'services': services?.map((e) => e.toJson()).toList(),
      };
}
