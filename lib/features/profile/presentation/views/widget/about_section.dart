import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/custom_container_bottom.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainerBottom(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kAboutView);
      },
      text: 'About Sakkiny'.tr(context),
      firstIcon: Icons.info_outline,
    );
  }
}
