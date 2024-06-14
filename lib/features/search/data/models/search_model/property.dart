import 'essentials.dart';
import 'location.dart';
import 'property_image.dart';

class Property {
  Essentials? essentials;
  Location? location;
  String? id;
  String? description;
  String? type;
  int? roomsNumber;
  int? bedrooms;
  int? bathrooms;
  String? addedBy;
  List<PropertyImage>? propertyImages;
  int? area;
  String? level;
  bool? isFurnished;
  int? price;
  String? per;
  String? numberOfGuests;
  String? propertyStatus;
  String? address;
  String? customId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Property({
    this.essentials,
    this.location,
    this.id,
    this.description,
    this.type,
    this.roomsNumber,
    this.bedrooms,
    this.bathrooms,
    this.addedBy,
    this.propertyImages,
    this.area,
    this.level,
    this.isFurnished,
    this.price,
    this.per,
    this.numberOfGuests,
    this.propertyStatus,
    this.address,
    this.customId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        essentials: json['essentials'] == null
            ? null
            : Essentials.fromJson(json['essentials'] as Map<String, dynamic>),
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        description: json['description'] as String?,
        type: json['type'] as String?,
        roomsNumber: json['roomsNumber'] as int?,
        bedrooms: json['bedrooms'] as int?,
        bathrooms: json['bathrooms'] as int?,
        addedBy: json['addedBy'] as String?,
        propertyImages: (json['propertyImages'] as List<dynamic>?)
            ?.map((e) => PropertyImage.fromJson(e as Map<String, dynamic>))
            .toList(),
        area: json['area'] as int?,
        level: json['level'] as String?,
        isFurnished: json['isFurnished'] as bool?,
        price: json['price'] as int?,
        per: json['per'] as String?,
        numberOfGuests: json['numberOfGuests'] as String?,
        propertyStatus: json['propertyStatus'] as String?,
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
        'essentials': essentials?.toJson(),
        'location': location?.toJson(),
        '_id': id,
        'description': description,
        'type': type,
        'roomsNumber': roomsNumber,
        'bedrooms': bedrooms,
        'bathrooms': bathrooms,
        'addedBy': addedBy,
        'propertyImages': propertyImages?.map((e) => e.toJson()).toList(),
        'area': area,
        'level': level,
        'isFurnished': isFurnished,
        'price': price,
        'per': per,
        'numberOfGuests': numberOfGuests,
        'propertyStatus': propertyStatus,
        'address': address,
        'customId': customId,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
