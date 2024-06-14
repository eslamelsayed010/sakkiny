import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/assets.dart';

class CustomImageSearchServices extends StatelessWidget {
  const CustomImageSearchServices({super.key});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        AssetsData.services,
        fit: BoxFit.cover,
        height: 140,
        width: 140,
      ),
    );
  }
}
