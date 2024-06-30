import 'image.dart';
import 'user_id.dart';

class Service {
  String? id;
  UserId? userId;
  String? serviceCategory;
  String? description;
  double? price;
  List<Image>? images;
  double? latitude;
  double? longitude;
  String? address;
  String? customId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? likesCount;

  Service({
    this.id,
    this.userId,
    this.serviceCategory,
    this.description,
    this.price,
    this.images,
    this.latitude,
    this.longitude,
    this.address,
    this.customId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.likesCount,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json['_id'] as String?,
        userId: json['userId'] == null
            ? null
            : UserId.fromJson(json['userId'] as Map<String, dynamic>),
        serviceCategory: json['serviceCategory'] as String?,
        description: json['description'] as String?,
        price: json['price'] as double?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
        latitude: json['latitude'] as double?,
        longitude: json['longitude'] as double?,
        address: json['address'] as String?,
        customId: json['customId'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        likesCount: json['likesCount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userId': userId?.toJson(),
        'serviceCategory': serviceCategory,
        'description': description,
        'price': price,
        'images': images?.map((e) => e.toJson()).toList(),
        'latitude': latitude,
        'longitude': longitude,
        'address': address,
        'customId': customId,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'likesCount': likesCount,
      };
}
