class ProfilePicture {
	String? secureUrl;
	String? publicId;

	ProfilePicture({this.secureUrl, this.publicId});

	factory ProfilePicture.fromJson(Map<String, dynamic> json) {
		return ProfilePicture(
			secureUrl: json['secure_url'] as String?,
			publicId: json['public_id'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'secure_url': secureUrl,
				'public_id': publicId,
			};
}
