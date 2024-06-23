class Location {
  double? latitude;
  double? longitude;
  String? id;

  Location({this.latitude, this.longitude, this.id});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
        '_id': id,
      };
}
