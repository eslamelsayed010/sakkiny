import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/widgets/details_property_section.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/search/presentation/views/widgets/custom_image_search.dart';

class CustomPropertyDetailsSearch extends StatelessWidget {
  const CustomPropertyDetailsSearch({Key? key, required this.property})
      : super(key: key);
  final Property property;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kSelectedView,
          extra: property,
        );
      },
      child: Column(
        children: [
          CustomImageSearch(property: property),
          DetailsPropertySection(property: property),
        ],
      ),
    );
  }
}
