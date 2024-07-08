import 'profile_picture.dart';

class User {
  ProfilePicture? profilePicture;
  String? id;
  String? email;
  String? name;
  String? password;
  String? role;
  String? phoneNumber;
  String? gender;
  int? age;
  String? status;
  bool? confirmEmail;
  bool? isVerified;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? usertoken;
  List<dynamic>? likedProperties;
  String? customId;
  List<dynamic>? likedServices;

  User({
    this.profilePicture,
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.phoneNumber,
    this.gender,
    this.age,
    this.status,
    this.confirmEmail,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.usertoken,
    this.likedProperties,
    this.customId,
    this.likedServices,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        profilePicture: json['profilePicture'] == null
            ? null
            : ProfilePicture.fromJson(
                json['profilePicture'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        email: json['email'] as String?,
        name: json['name'] as String?,
        password: json['password'] as String?,
        role: json['role'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        gender: json['gender'] as String?,
        age: json['age'] as int?,
        status: json['status'] as String?,
        confirmEmail: json['confirmEmail'] as bool?,
        isVerified: json['isVerified'] as bool?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        usertoken: json['usertoken'] as String?,
        likedProperties: json['likedProperties'] as List<dynamic>?,
        customId: json['customId'] as String?,
        likedServices: json['likedServices'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'profilePicture': profilePicture?.toJson(),
        '_id': id,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'phoneNumber': phoneNumber,
        'gender': gender,
        'age': age,
        'status': status,
        'confirmEmail': confirmEmail,
        'isVerified': isVerified,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'usertoken': usertoken,
        'likedProperties': likedProperties,
        'customId': customId,
        'likedServices': likedServices,
      };
}
