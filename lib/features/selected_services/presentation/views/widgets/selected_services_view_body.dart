import 'package:flutter/material.dart';
import 'package:sakkiny/features/selected_services/presentation/views/widgets/custom_services_details.dart';
import 'package:sakkiny/features/selected_services/presentation/views/widgets/page_view_image_services.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

class SelectedServicesViewBody extends StatelessWidget {
  const SelectedServicesViewBody({Key? key, required this.service})
      : super(key: key);
  final Service service;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageViewImageServices(
            service: service,
          ),
          const SizedBox(height: 30),
          CustomServicesDetails(
            service: service,
          ),
        ],
      ),
    );
  }
}
