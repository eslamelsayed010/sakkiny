import 'package:flutter/material.dart';
import 'package:sakkiny/core/widgets/custom_divider.dart';
import 'package:sakkiny/features/selected_services/presentation/views/widgets/connect_section.dart';
import 'package:sakkiny/features/selected_services/presentation/views/widgets/custom_owner_services_details.dart';
import 'package:sakkiny/features/selected_services/presentation/views/widgets/location_service_section.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

class CustomServicesDetails extends StatelessWidget {
  const CustomServicesDetails({Key? key, required this.service})
      : super(key: key);
  final Service service;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              LocationServiceSection(service: service),
              const SizedBox(height: 20),
              // DescServicesSection(
              //   service: service,
              // ),
              const SizedBox(height: 20),
              CustomOwnerServicesDetails(
                service: service,
              ),
              const SizedBox(height: 20),
              const CustomDivider(padding: EdgeInsets.zero),
              const SizedBox(height: 20),
              //BookSection(),
            ],
          ),
        ),
        ConnectSectionService(userId: service.userId!),
        const SizedBox(height: 20),
      ],
    );
  }
}
