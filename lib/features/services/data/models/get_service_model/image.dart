class Image {
	String? secureUrl;
	String? publicId;
	String? id;

	Image({this.secureUrl, this.publicId, this.id});

	factory Image.fromJson(Map<String, dynamic> json) => Image(
		secureUrl: json['secure_url'] as String?,
		publicId: json['public_id'] as String?,
		id: json['_id'] as String?,
	);

	Map<String, dynamic> toJson() => {
		'secure_url': secureUrl,
		'public_id': publicId,
		'_id': id,
	};
}
