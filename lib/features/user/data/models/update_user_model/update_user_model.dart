import 'user.dart';

class UpdateUserModel {
  String? message;
  User? user;

  UpdateUserModel({this.message, this.user});

  factory UpdateUserModel.fromJson(Map<String, dynamic> json) =>
      UpdateUserModel(
        message: json['message'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user?.toJson(),
      };
}
