class VerifyIdentityModel {
  bool? status;
  String? message;

  VerifyIdentityModel({this.status, this.message});

  factory VerifyIdentityModel.fromJson(Map<String, dynamic> json) {
    return VerifyIdentityModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };
}
