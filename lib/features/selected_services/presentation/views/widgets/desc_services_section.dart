import 'package:flutter/material.dart';
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
          service.serviceCategory!,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Beginning from LE 100',
          style: TextStyle(
            color: kLogoColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          service.description!,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
