import 'essentials.dart';
import 'location.dart';
import 'property_image.dart';

class Property {
  String? description;
  String? type;
  int? bedrooms;
  int? bathrooms;
  String? addedBy;
  List<PropertyImage>? propertyImages;
  int? area;
  String? level;
  bool? isFurnished;
  Essentials? essentials;
  int? price;
  String? per;
  String? numberOfGuests;
  String? propertyStatus;
  Location? location;
  String? address;
  String? customId;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Property({
    this.description,
    this.type,
    this.bedrooms,
    this.bathrooms,
    this.addedBy,
    this.propertyImages,
    this.area,
    this.level,
    this.isFurnished,
    this.essentials,
    this.price,
    this.per,
    this.numberOfGuests,
    this.propertyStatus,
    this.location,
    this.address,
    this.customId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        description: json['description'] as String?,
        type: json['type'] as String?,
        bedrooms: json['bedrooms'] as int?,
        bathrooms: json['bathrooms'] as int?,
        addedBy: json['addedBy'] as String?,
        propertyImages: (json['propertyImages'] as List<dynamic>?)
            ?.map((e) => PropertyImage.fromJson(e as Map<String, dynamic>))
            .toList(),
        area: json['area'] as int?,
        level: json['level'] as String?,
        isFurnished: json['isFurnished'] as bool?,
        essentials: json['essentials'] == null
            ? null
            : Essentials.fromJson(json['essentials'] as Map<String, dynamic>),
        price: json['price'] as int?,
        per: json['per'] as String?,
        numberOfGuests: json['numberOfGuests'] as String?,
        propertyStatus: json['propertyStatus'] as String?,
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
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
        'description': description,
        'type': type,
        'bedrooms': bedrooms,
        'bathrooms': bathrooms,
        'addedBy': addedBy,
        'propertyImages': propertyImages?.map((e) => e.toJson()).toList(),
        'area': area,
        'level': level,
        'isFurnished': isFurnished,
        'essentials': essentials?.toJson(),
        'price': price,
        'per': per,
        'numberOfGuests': numberOfGuests,
        'propertyStatus': propertyStatus,
        'location': location?.toJson(),
        'address': address,
        'customId': customId,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
