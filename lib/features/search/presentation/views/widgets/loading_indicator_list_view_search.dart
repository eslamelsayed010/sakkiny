import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/widgets/custom_divider.dart';
import 'package:sakkiny/features/search/presentation/views/widgets/loading_indicator_search.dart';

class LoadingIndicatorListViewSearch extends StatelessWidget {
  const LoadingIndicatorListViewSearch({Key? key}) : super(key: key);

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
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => const LoadingIndicatorSearch(),
              separatorBuilder: (context, index) => const CustomDivider(),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
