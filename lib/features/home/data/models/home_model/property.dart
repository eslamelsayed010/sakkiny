import 'added_by.dart';
import 'essentials.dart';
import 'property_image.dart';

class Property {
  Essentials? essentials;
  String? id;
  String? description;
  String? type;
  int? roomsNumber;
  int? bedrooms;
  int? bathrooms;
  AddedBy? addedBy;
  String? addedByType;
  List<PropertyImage>? propertyImages;
  int? area;
  String? level;
  bool? isFurnished;
  bool? userVerified;
  int? price;
  String? per;
  String? numberOfGuests;
  String? propertyStatus;
  String? address;
  num? latitude;
  num? longitude;
  String? customId;
  int? likesCount;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Property({
    this.essentials,
    this.id,
    this.description,
    this.type,
    this.roomsNumber,
    this.bedrooms,
    this.bathrooms,
    this.addedBy,
    this.addedByType,
    this.propertyImages,
    this.area,
    this.level,
    this.isFurnished,
    this.userVerified,
    this.price,
    this.per,
    this.numberOfGuests,
    this.propertyStatus,
    this.address,
    this.latitude,
    this.longitude,
    this.customId,
    this.likesCount,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        essentials: json['essentials'] == null
            ? null
            : Essentials.fromJson(json['essentials'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        description: json['description'] as String?,
        type: json['type'] as String?,
        roomsNumber: json['roomsNumber'] as int?,
        bedrooms: json['bedrooms'] as int?,
        bathrooms: json['bathrooms'] as int?,
        addedBy: json['addedBy'] == null
            ? null
            : AddedBy.fromJson(json['addedBy'] as Map<String, dynamic>),
        addedByType: json['addedByType'] as String?,
        propertyImages: (json['propertyImages'] as List<dynamic>?)
            ?.map((e) => PropertyImage.fromJson(e as Map<String, dynamic>))
            .toList(),
        area: json['area'] as int?,
        level: json['level'] as String?,
        isFurnished: json['isFurnished'] as bool?,
        userVerified: json['userVerified'] as bool?,
        price: json['price'] as int?,
        per: json['per'] as String?,
        numberOfGuests: json['numberOfGuests'] as String?,
        propertyStatus: json['propertyStatus'] as String?,
        address: json['address'] as String?,
        latitude: json['latitude'] as num?,
        longitude: json['longitude'] as num?,
        customId: json['customId'] as String?,
        likesCount: json['likesCount'] as int?,
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
        '_id': id,
        'description': description,
        'type': type,
        'roomsNumber': roomsNumber,
        'bedrooms': bedrooms,
        'bathrooms': bathrooms,
        'addedBy': addedBy?.toJson(),
        'addedByType': addedByType,
        'propertyImages': propertyImages?.map((e) => e.toJson()).toList(),
        'area': area,
        'level': level,
        'isFurnished': isFurnished,
        'userVerified': userVerified,
        'price': price,
        'per': per,
        'numberOfGuests': numberOfGuests,
        'propertyStatus': propertyStatus,
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
        'customId': customId,
        'likesCount': likesCount,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
