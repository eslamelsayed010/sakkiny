import 'package:flutter/material.dart';
import 'package:sakkiny/core/widgets/custom_divider.dart';
import 'package:sakkiny/features/search/presentation/views/widgets/loading_indicator_search.dart';

class LoadingIndicatorListViewSearch extends StatelessWidget {
  const LoadingIndicatorListViewSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => const LoadingIndicatorSearch(),
        separatorBuilder: (context, index) => const CustomDivider(),
        itemCount: 10,
      ),
    );
  }
}
