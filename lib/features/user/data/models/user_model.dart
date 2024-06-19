class UserModel {
  final String? name;
  final String? image;
  final String? phone;
  final String? uId;

  UserModel({this.name, this.image, this.phone, this.uId});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      image: json['image'],
      phone: json['phone'],
      uId: json['uId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'uId': uId,
      'image': image,
    };
  }
}
