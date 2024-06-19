import 'image.dart';

class Service {
  String? description;
  List<Image>? images;

  Service({this.description, this.images});

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        description: json['description'] as String?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'description': description,
        'images': images?.map((e) => e.toJson()).toList(),
      };
}
