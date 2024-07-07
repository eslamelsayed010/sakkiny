import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';

class DescSection extends StatelessWidget {
  const DescSection({Key? key, required this.property}) : super(key: key);
  final Property property;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Description : '.tr(context),
              style: const TextStyle(
                color: kLogoColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              'Level : '.tr(context) + property.level!.tr(context),
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                property.description!,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              '${'Likes : '.tr(context)}${property.likesCount}',
              style: const TextStyle(color: kLogoColor),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  property.isFurnished!
                      ? 'Furnished'.tr(context)
                      : 'Not Furnished'.tr(context),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
