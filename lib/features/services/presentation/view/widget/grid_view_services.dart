import 'package:flutter/material.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';
import 'package:sakkiny/features/services/presentation/view/widget/custom_services.dart';

class GridViewServices extends StatelessWidget {
  const GridViewServices({Key? key, required this.services}) : super(key: key);

  final List<Service> services;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 12,
      childAspectRatio: 1 / 1.6,
      children: List.generate(
        services.length,
        (index) =>
            CustomServices(service: services[index]), // Removed const here
      ),
    );
  }
}
