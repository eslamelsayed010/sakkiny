import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/widgets/custom_divider.dart';
import 'package:sakkiny/features/search_services/presentation/views/widgets/custom_services_details_search.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

class ListViewSearchServices extends StatelessWidget {
  const ListViewSearchServices({Key? key, required this.services})
      : super(key: key);
  final List<Service> services;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Search Result'.tr(context),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  CustomServicesDetailsSearch(service: services[index]),
              separatorBuilder: (context, index) => const CustomDivider(),
              itemCount: services.length,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
