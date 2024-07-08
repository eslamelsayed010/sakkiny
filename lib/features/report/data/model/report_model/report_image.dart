class ReportImage {
	String? secureUrl;
	String? publicId;

	ReportImage({this.secureUrl, this.publicId});

	factory ReportImage.fromJson(Map<String, dynamic> json) => ReportImage(
				secureUrl: json['secure_url'] as String?,
				publicId: json['public_id'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'secure_url': secureUrl,
				'public_id': publicId,
			};
}
