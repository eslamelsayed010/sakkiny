import 'package:sakkiny/features/home/data/models/home_model/profile_picture.dart';

class AddedBy {
  ProfilePicture? profilePicture;
  String? email;
  String? name;
  String? phoneNumber;
  String? gender;
  String? status;

  AddedBy({
    this.profilePicture,
    this.email,
    this.name,
    this.phoneNumber,
    this.gender,
    this.status,
  });

  factory AddedBy.fromJson(Map<String, dynamic> json) => AddedBy(
        profilePicture: json['profilePicture'] == null
            ? null
            : ProfilePicture.fromJson(
                json['profilePicture'] as Map<String, dynamic>),
        email: json['email'] as String?,
        name: json['name'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        gender: json['gender'] as String?,
        status: json['status'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'profilePicture': profilePicture?.toJson(),
        'email': email,
        'name': name,
        'phoneNumber': phoneNumber,
        'gender': gender,
        'status': status,
      };
}
