import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';

class SizeSection extends StatelessWidget {
  const SizeSection({super.key, required this.property});
  final Property property;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.bed_outlined),
        const SizedBox(width: 3),
        Text(
          '${property.bedrooms!} ${'Beds'.tr(context)}',
          style: const TextStyle(fontSize: 12),
        ),
        const Spacer(),
        const Icon(Icons.bathtub_outlined),
        const SizedBox(width: 3),
        Text(
          '${property.bathrooms!} ${'Bath'.tr(context)}',
          style: const TextStyle(fontSize: 12),
        ),
        const Spacer(),
        const Icon(Icons.photo_size_select_small_outlined),
        const SizedBox(width: 3),
        Text(
          '${property.area!} ${'M'.tr(context)}',
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
