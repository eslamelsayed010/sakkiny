import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

class DescServicesSection extends StatelessWidget {
  const DescServicesSection({Key? key, required this.service})
      : super(key: key);
  final Service service;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description : '.tr(context),
          style: const TextStyle(
            color: kLogoColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          '${'Service Category : '.tr(context)}${service.serviceCategory!.tr(context)}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          service.description!,
          style: const TextStyle(
            color: kLogoColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 10),
        Text(
          '${'Address : '.tr(context)}${service.address}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '${'Price : '.tr(context)}${service.price}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '${'Name : '.tr(context)}${service.userId!.name!}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '${'Phone : '.tr(context)}${service.userId!.phoneNumber!}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '${'Email : '.tr(context)}${service.userId!.email!}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        // const SizedBox(height: 10),
        //   Text(
        //   'Status:  ${service.userId!.status!}',
        //   style: const TextStyle(
        //     color: Colors.black,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 13,
        //   ),
        // ),
        const SizedBox(height: 10),
      ],
    );
  }
}
