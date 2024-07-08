import 'user.dart';

class UserModel {
  bool? status;
  String? message;
  User? user;

  UserModel({this.status, this.message, this.user});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'user': user?.toJson(),
      };
}
