import 'package:flutter/material.dart';
import 'package:sakkiny/core/widgets/custom_divider.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/selected/presentation/views/widgets/connect_section.dart';
import 'package:sakkiny/features/selected/presentation/views/widgets/custom_owner_details.dart';
import 'package:sakkiny/features/selected/presentation/views/widgets/location_section.dart';
import 'package:sakkiny/features/selected/presentation/views/widgets/size_section.dart';

class CustomHomeDetails extends StatelessWidget {
  const CustomHomeDetails({Key? key, required this.property}) : super(key: key);
  final Property property;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              LocationSection(property: property),
              const SizedBox(height: 20),
              SizeSection(property: property),
              const SizedBox(height: 20),
              CustomOwnerDetails(property: property),
              const SizedBox(height: 20),
              const CustomDivider(padding: EdgeInsets.zero),
              const SizedBox(height: 20),
              //RentSection(),
            ],
          ),
        ),
        ConnectSection(addedBy: property.addedBy!),
      ],
    );
  }
}
