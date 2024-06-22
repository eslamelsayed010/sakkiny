
class Location {
  num? latitude;
  num? longitude;
  String? id;

  Location({this.latitude, this.longitude, this.id});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json['latitude'] as num?,
        longitude: json['longitude'] as num?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
        '_id': id,
      };
}
