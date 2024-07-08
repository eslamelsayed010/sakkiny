class AddedBy {
	String? email;
	String? name;
	String? phoneNumber;
	String? gender;
	String? status;

	AddedBy({
		this.email, 
		this.name, 
		this.phoneNumber, 
		this.gender, 
		this.status, 
	});

	factory AddedBy.fromJson(Map<String, dynamic> json) => AddedBy(
				email: json['email'] as String?,
				name: json['name'] as String?,
				phoneNumber: json['phoneNumber'] as String?,
				gender: json['gender'] as String?,
				status: json['status'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'email': email,
				'name': name,
				'phoneNumber': phoneNumber,
				'gender': gender,
				'status': status,
			};
}
