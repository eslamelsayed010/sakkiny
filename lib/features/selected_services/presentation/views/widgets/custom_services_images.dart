import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/assets.dart';

class CustomServicesImage extends StatelessWidget {
  const CustomServicesImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        AssetsData.services,
        fit: BoxFit.cover,
      ),
    );
  }
}
