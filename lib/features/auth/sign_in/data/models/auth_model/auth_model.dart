import 'data.dart';

class AuthModel {
  bool? status;
  String? message;
  Data? data;

  AuthModel({this.status, this.message, this.data});

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
