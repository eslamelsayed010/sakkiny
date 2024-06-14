import 'package:flutter/material.dart';
import 'package:sakkiny/core/widgets/custom_divider.dart';
import 'package:sakkiny/features/search_services/presentation/views/widgets/custom_services_details_search.dart';

class ListViewSearchServices extends StatelessWidget {
  const ListViewSearchServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Search Result',
              style: TextStyle(
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
              itemBuilder: (context, index) =>
                  const CustomServicesDetailsSearch(),
              separatorBuilder: (context, index) => const CustomDivider(),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
