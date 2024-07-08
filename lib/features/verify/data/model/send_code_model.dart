class SendCodeModel {
  bool? status;
  String? message;

  SendCodeModel({this.status, this.message});

  factory SendCodeModel.fromJson(Map<String, dynamic> json) => SendCodeModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };
}
