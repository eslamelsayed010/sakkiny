import 'report_image.dart';

class Feedback {
	String? message;
	String? subject;
	String? name;
	ReportImage? reportImage;
	String? email;
	String? contactNumber;
	String? customId;
	String? id;
	DateTime? createdAt;
	DateTime? updatedAt;
	int? v;

	Feedback({
		this.message, 
		this.subject, 
		this.name, 
		this.reportImage, 
		this.email, 
		this.contactNumber, 
		this.customId, 
		this.id, 
		this.createdAt, 
		this.updatedAt, 
		this.v, 
	});

	factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
				message: json['message'] as String?,
				subject: json['subject'] as String?,
				name: json['name'] as String?,
				reportImage: json['reportImage'] == null
						? null
						: ReportImage.fromJson(json['reportImage'] as Map<String, dynamic>),
				email: json['email'] as String?,
				contactNumber: json['contactNumber'] as String?,
				customId: json['customId'] as String?,
				id: json['_id'] as String?,
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
				updatedAt: json['updatedAt'] == null
						? null
						: DateTime.parse(json['updatedAt'] as String),
				v: json['__v'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'subject': subject,
				'name': name,
				'reportImage': reportImage?.toJson(),
				'email': email,
				'contactNumber': contactNumber,
				'customId': customId,
				'_id': id,
				'createdAt': createdAt?.toIso8601String(),
				'updatedAt': updatedAt?.toIso8601String(),
				'__v': v,
			};
}
