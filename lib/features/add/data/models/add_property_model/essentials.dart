class Essentials {
  bool? balcony;
  bool? wifi;
  bool? naturalGas;
  bool? elevator;
  bool? privateGarden;
  bool? landLine;
  bool? kitchen;
  bool? parking;
  bool? conditioning;
  bool? electricityMeter;
  bool? waterMeter;

  Essentials({
    this.balcony,
    this.wifi,
    this.naturalGas,
    this.elevator,
    this.privateGarden,
    this.landLine,
    this.kitchen,
    this.parking,
    this.conditioning,
    this.electricityMeter,
    this.waterMeter,
  });

  factory Essentials.fromJson(Map<String, dynamic> json) => Essentials(
        balcony: json['balcony'] as bool?,
        wifi: json['wifi'] as bool?,
        naturalGas: json['naturalGas'] as bool?,
        elevator: json['elevator'] as bool?,
        privateGarden: json['privateGarden'] as bool?,
        landLine: json['landLine'] as bool?,
        kitchen: json['kitchen'] as bool?,
        parking: json['parking'] as bool?,
        conditioning: json['conditioning'] as bool?,
        electricityMeter: json['electricityMeter'] as bool?,
        waterMeter: json['waterMeter'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'balcony': balcony,
        'wifi': wifi,
        'naturalGas': naturalGas,
        'elevator': elevator,
        'privateGarden': privateGarden,
        'landLine': landLine,
        'kitchen': kitchen,
        'parking': parking,
        'conditioning': conditioning,
        'electricityMeter': electricityMeter,
        'waterMeter': waterMeter,
      };
}
