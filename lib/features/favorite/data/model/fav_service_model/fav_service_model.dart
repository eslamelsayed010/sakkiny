import 'service.dart';

class FavServiceModel {
	bool? status;
	String? message;
	List<Service>? services;

	FavServiceModel({this.status, this.message, this.services});

	factory FavServiceModel.fromJson(Map<String, dynamic> json) {
		return FavServiceModel(
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
