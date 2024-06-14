import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';

class DescServicesSection extends StatelessWidget {
  const DescServicesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Electrical maintenance services',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Beginning from LE 100',
          style: TextStyle(
            color: kLogoColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'For Technician conducts an inspection to determine the maintenance process and cost',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
