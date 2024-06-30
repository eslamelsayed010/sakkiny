import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/custom_container_bottom.dart';

class VerifySection extends StatelessWidget {
  const VerifySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainerBottom(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kVerifyView);
      },
      text: 'Verify Your Account'.tr(context),
      firstIcon: Icons.verified_user_outlined,
    );
  }
}
