import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_divider.dart';
import 'package:sakkiny/features/filter/presentation/views/widgets/custom_no_result_search.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/search/presentation/views/widgets/custom_property_details_search.dart';

class ListViewFilterResult extends StatelessWidget {
  const ListViewFilterResult({Key? key, required this.property})
      : super(key: key);
  final List<Property> property;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    FloatingActionButton(
                      heroTag: 'arrow_back_home',
                      backgroundColor: Colors.white,
                      mini: true,
                      child: const Icon(
                        Icons.arrow_back,
                        color: kLogoColor,
                      ),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                    const Spacer(),
                    const Center(
                      child: Text(
                        'Result',
                        style: TextStyle(
                          color: kLogoColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (property.isEmpty)
                const CustomNoResult()
              else
                ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      CustomPropertyDetailsSearch(property: property[index]),
                  separatorBuilder: (context, index) => const CustomDivider(),
                  itemCount: property.length,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
