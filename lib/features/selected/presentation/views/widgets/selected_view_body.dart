import 'package:flutter/material.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/selected/presentation/views/widgets/custom_home_details.dart';
import 'package:sakkiny/features/selected/presentation/views/widgets/custom_home_type.dart';
import 'package:sakkiny/features/selected/presentation/views/widgets/page_view_image.dart';

class SelectedViewBody extends StatelessWidget {
  const SelectedViewBody({Key? key, required this.property}) : super(key: key);
  final Property property;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageViewImage(property: property),
          const SizedBox(height: 10),
          CustomHomeType(property: property),
          const SizedBox(height: 25),
          CustomHomeDetails(property: property),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
