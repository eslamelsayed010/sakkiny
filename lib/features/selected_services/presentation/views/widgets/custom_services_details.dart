import 'package:flutter/material.dart';
import 'package:sakkiny/core/widgets/custom_divider.dart';
import 'package:sakkiny/features/selected/presentation/views/widgets/connect_section.dart';
import 'package:sakkiny/features/selected_services/presentation/views/widgets/custom_owner_services_details.dart';
import 'package:sakkiny/features/selected_services/presentation/views/widgets/desc_services_section.dart';

class CustomServicesDetails extends StatelessWidget {
  const CustomServicesDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: const [
              DescServicesSection(),
              SizedBox(height: 50),
              CustomOwnerServicesDetails(),
              SizedBox(height: 50),
              CustomDivider(padding: EdgeInsets.zero),
              SizedBox(height: 50),
              //BookSection(),
            ],
          ),
        ),
        const ConnectSection()
      ],
    );
  }
}
