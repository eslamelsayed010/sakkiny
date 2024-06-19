import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomServicesImage extends StatelessWidget {
  const CustomServicesImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        imageUrl: image,
        // fit: BoxFit.cover,
        errorWidget: (context, url, error) => const Icon(Icons.error_outline),
      ),
    );
  }
}
