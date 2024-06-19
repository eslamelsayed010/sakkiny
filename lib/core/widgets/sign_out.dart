import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/cache_helper.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_text_button.dart';

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      GoRouter.of(context).pushReplacement(AppRouter.kGetStartView);
    }
  });
}

class CustomSignOutButton extends StatelessWidget {
  const CustomSignOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.logout_outlined,
        color: kLogoColor,
      ),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          context: context,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                CustomTextButton(
                  text: 'Do you want sign out !'.tr(context),
                  textButton: 'Yes'.tr(context),
                  txtColor: Colors.red,
                  onPressed: () {
                    signOut(context);
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
