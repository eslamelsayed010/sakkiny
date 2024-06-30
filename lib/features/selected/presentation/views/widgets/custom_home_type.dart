import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/selected/presentation/views/widgets/desc_section.dart';
import 'package:sakkiny/features/selected/presentation/views/widgets/essentials_section.dart';

class CustomHomeType extends StatelessWidget {
  const CustomHomeType({
    super.key,
    required this.property,
  });
  final Property property;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black),
            ),
            child: Text(
              property.type!.tr(context),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black),
            ),
            child: property.isFurnished! == true
                ? Text(
                    'Furnished'.tr(context),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  )
                : Text(
                    'Not Furnished'.tr(context),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DescSection(property: property),
                    const SizedBox(height: 20),
                    EssentialsSection(property: property),
                  ],
                ),
              ),
            );
          },
          icon: const Icon(Icons.info_outline),
        )
      ],
    );
  }
}
