class Location {
  int? latitude;
  int? longitude;
  String? id;

  Location({this.latitude, this.longitude, this.id});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json['latitude'] as int?,
        longitude: json['longitude'] as int?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
        '_id': id,
      };
}
