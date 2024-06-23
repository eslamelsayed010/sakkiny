import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/widgets/custom_divider.dart';
import 'package:sakkiny/features/search_services/presentation/views/widgets/loading_indicator/custom_search_service_loading_indicator.dart';

class ListViewSearchServicesLoadingIndicator extends StatelessWidget {
  const ListViewSearchServicesLoadingIndicator({Key? key}) : super(key: key);

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
                  const CustomSearchServiceLoadingIndicator(),
              separatorBuilder: (context, index) => const CustomDivider(),
              itemCount: 10,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
