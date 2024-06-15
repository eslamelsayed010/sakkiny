import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';

class DetailsPropertySection extends StatelessWidget {
  const DetailsPropertySection({super.key, required this.property});
  final Property property;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Text(
                property.type!,
                style: const TextStyle(
                  color: kLogoColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const Spacer(),
              Text(
                'LE ${property.price!}/month',
                style: const TextStyle(
                  fontSize: 13,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: kLocationColor,
            ),
            Text(
              property.address!,
              style: const TextStyle(
                fontSize: 13,
                color: kLocationColor,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.bed),
            const SizedBox(width: 10),
            Text('${property.bedrooms!} Rooms'),
            const SizedBox(width: 20),
            const Icon(Icons.photo_size_select_small),
            const SizedBox(width: 10),
            Text('${property.area!}M'),
          ],
        ),
      ],
    );
  }
}
