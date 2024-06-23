import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';

class EssentialsSection extends StatelessWidget {
  const EssentialsSection({Key? key, required this.property}) : super(key: key);
  final Property property;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Essentials : '.tr(context),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (property.essentials!.balcony == true)
              Row(
                children: [
                  const Icon(
                    Icons.balcony_outlined,
                    color: kLogoColor,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'balcony'.tr(context),
                    style: const TextStyle(color: kLogoColor),
                  )
                ],
              ),
            if (property.essentials!.wifi == true)
              Row(
                children: [
                  const Icon(
                    Icons.wifi,
                    color: kLogoColor,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'wifi'.tr(context),
                    style: const TextStyle(color: kLogoColor),
                  )
                ],
              ),
            if (property.essentials!.naturalGas == true)
              Row(
                children: [
                  const Icon(
                    Icons.local_gas_station_outlined,
                    color: kLogoColor,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'naturalGas'.tr(context),
                    style: const TextStyle(color: kLogoColor),
                  )
                ],
              ),
          ],
        ),
        if (property.essentials!.balcony == true ||
            property.essentials!.wifi == true ||
            property.essentials!.naturalGas == true)
          const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (property.essentials!.elevator == true)
              Row(
                children: [
                  const Icon(
                    Icons.elevator_outlined,
                    color: kLogoColor,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'elevator'.tr(context),
                    style: const TextStyle(color: kLogoColor),
                  )
                ],
              ),
            if (property.essentials!.landLine == true)
              Row(
                children: [
                  const Icon(
                    Icons.landscape_outlined,
                    color: kLogoColor,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'landLine'.tr(context),
                    style: const TextStyle(color: kLogoColor),
                  )
                ],
              ),
            if (property.essentials!.privateGarden == true)
              Row(
                children: [
                  const Icon(
                    Icons.private_connectivity_outlined,
                    color: kLogoColor,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'privateGarden'.tr(context),
                    style: const TextStyle(color: kLogoColor),
                  )
                ],
              ),
          ],
        ),
        if (property.essentials!.elevator == true ||
            property.essentials!.landLine == true ||
            property.essentials!.privateGarden == true)
          const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (property.essentials!.kitchen == true)
              Row(
                children: [
                  const Icon(
                    Icons.kitchen_outlined,
                    color: kLogoColor,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'kitchen'.tr(context),
                    style: const TextStyle(color: kLogoColor),
                  )
                ],
              ),
            if (property.essentials!.parking == true)
              Row(
                children: [
                  const Icon(
                    Icons.car_repair,
                    color: kLogoColor,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'parking'.tr(context),
                    style: const TextStyle(color: kLogoColor),
                  )
                ],
              ),
            if (property.essentials!.conditioning == true)
              Row(
                children: [
                  const Icon(
                    Icons.air_outlined,
                    color: kLogoColor,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'conditioning'.tr(context),
                    style: const TextStyle(color: kLogoColor),
                  )
                ],
              ),
          ],
        ),
        if (property.essentials!.kitchen == true ||
            property.essentials!.parking == true ||
            property.essentials!.conditioning == true)
          const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (property.essentials!.waterMeter == true)
              Row(
                children: [
                  const Icon(
                    Icons.water_drop_outlined,
                    color: kLogoColor,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'waterMeter'.tr(context),
                    style: const TextStyle(color: kLogoColor),
                  )
                ],
              ),
            if (property.essentials!.electricityMeter == true)
              Row(
                children: [
                  const Icon(
                    Icons.electric_bolt_outlined,
                    color: kLogoColor,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'electricityMeter'.tr(context),
                    style: const TextStyle(color: kLogoColor),
                  )
                ],
              ),
          ],
        ),
      ],
    );
  }
}
