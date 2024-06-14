import 'service.dart';

class GetServiceModel {
	bool? status;
	String? message;
	List<Service>? services;

	GetServiceModel({this.status, this.message, this.services});

	factory GetServiceModel.fromJson(Map<String, dynamic> json) {
		return GetServiceModel(
			status: json['status'] as bool?,
			message: json['message'] as String?,
			services: (json['services'] as List<dynamic>?)
						?.map((e) => Service.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'services': services?.map((e) => e.toJson()).toList(),
			};
}
