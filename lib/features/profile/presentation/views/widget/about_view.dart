import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/custom_profile_app_bar.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarProfile(
        context,
        'About Sakkiny'.tr(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Text(
          style: const TextStyle(
            height: 1.5,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          'Sakkiny is a mobile app that connects tenants with verified apartment owners who are willing to rent their properties to them and provide online service providers and maintenance workers to facilitate the maintenance process or any changes the tenant need to make during the stay.'
              .tr(context),
        ),
      ),
    );
  }
}
