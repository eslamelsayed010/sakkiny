import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_divider.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/search/presentation/views/widgets/custom_property_details_search.dart';

class ViewAllListView extends StatelessWidget {
  const ViewAllListView({Key? key, required this.properties}) : super(key: key);
  final List<Property> properties;
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
                    Center(
                      child: Text(
                        'All Property'.tr(context),
                        style: const TextStyle(
                          color: kLogoColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    CustomPropertyDetailsSearch(property: properties[index]),
                separatorBuilder: (context, index) => const CustomDivider(),
                itemCount: properties.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
