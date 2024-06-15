import 'package:flutter/material.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/home/presentation/views/widget/custom_home_details.dart';

class ListViewProperty extends StatelessWidget {
  const ListViewProperty({Key? key, required this.properties})
      : super(key: key);
  final List<Property> properties;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .33,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            CustomHomeDetails(property: properties[index]),
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemCount: properties.length,
      ),
    );
  }
}
