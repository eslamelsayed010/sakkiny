class Location {
  int? long;
  int? lat;

  Location({this.long, this.lat});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        long: json['long'] as int?,
        lat: json['lat'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'long': long,
        'lat': lat,
      };
}
