import 'image.dart';

class Service {
  String? userId;
  String? serviceCategory;
  String? description;
  int? price;
  List<Image>? images;
  // Location? location;
  num? latitude;
  num? longitude;
  String? address;
  String? customId;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Service({
    this.userId,
    this.serviceCategory,
    this.description,
    this.price,
    this.images,
    // this.location,
    this.latitude,
    this.longitude,
    this.address,
    this.customId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        userId: json['userId'] as String?,
        serviceCategory: json['serviceCategory'] as String?,
        description: json['description'] as String?,
        price: json['price'] as int?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
        // location: json['location'] == null
        //     ? null
        //     : Location.fromJson(json['location'] as Map<String, dynamic>),
        latitude: json['latitude'] as num?,
        longitude: json['longitude'] as num?,
        address: json['address'] as String?,
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
        'userId': userId,
        'serviceCategory': serviceCategory,
        'description': description,
        'price': price,
        'images': images?.map((e) => e.toJson()).toList(),
        //'location': location?.toJson(),
        'latitude': latitude,
        'longitude': longitude,
        'address': address,
        'customId': customId,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
