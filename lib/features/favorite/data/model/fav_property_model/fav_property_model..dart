import 'property.dart';

class FavPropertyModel {
	bool? status;
	String? message;
	List<Property>? properties;

	FavPropertyModel({this.status, this.message, this.properties});

	factory FavPropertyModel.fromJson(Map<String, dynamic> json) {
		return FavPropertyModel(
			status: json['status'] as bool?,
			message: json['message'] as String?,
			properties: (json['properties'] as List<dynamic>?)
						?.map((e) => Property.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'properties': properties?.map((e) => e.toJson()).toList(),
			};
}
