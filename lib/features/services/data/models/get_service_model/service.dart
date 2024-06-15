import 'image.dart';
import 'location.dart';

class Service {
  String? id;
  String? userId;
  String? serviceCategory;
  String? description;
  int? price;
  List<Image>? images;
  Location? location;
  String? address;
  String? customId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Service({
    this.id,
    this.userId,
    this.serviceCategory,
    this.description,
    this.price,
    this.images,
    this.location,
    this.address,
    this.customId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json['_id'] as String?,
        userId: json['userId'] as String?,
        serviceCategory: json['serviceCategory'] as String?,
        description: json['description'] as String?,
        price: json['price'] as int?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        address: json['address'] as String?,
        customId: json['customId'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userId': userId,
        'serviceCategory': serviceCategory,
        'description': description,
        'price': price,
        'images': images?.map((e) => e.toJson()).toList(),
        'location': location?.toJson(),
        'address': address,
        'customId': customId,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
