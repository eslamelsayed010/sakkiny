import 'feedback.dart';

class ReportModel {
	bool? status;
	String? message;
	Feedback? feedback;

	ReportModel({this.status, this.message, this.feedback});

	factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
				status: json['status'] as bool?,
				message: json['message'] as String?,
				feedback: json['feedback'] == null
						? null
						: Feedback.fromJson(json['feedback'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'feedback': feedback?.toJson(),
			};
}
