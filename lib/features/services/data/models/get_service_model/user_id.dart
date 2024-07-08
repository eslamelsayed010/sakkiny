import 'profile_picture.dart';

class UserId {
	ProfilePicture? profilePicture;
	String? email;
	String? name;
	String? phoneNumber;
	String? gender;
	String? status;

	UserId({
		this.profilePicture, 
		this.email, 
		this.name, 
		this.phoneNumber, 
		this.gender, 
		this.status, 
	});

	factory UserId.fromJson(Map<String, dynamic> json) => UserId(
				profilePicture: json['profilePicture'] == null
						? null
						: ProfilePicture.fromJson(json['profilePicture'] as Map<String, dynamic>),
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
