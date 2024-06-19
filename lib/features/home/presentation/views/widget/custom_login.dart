import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/const.dart';

class CustomLogin extends StatelessWidget {
  const CustomLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          const Spacer(),
          TextButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSignInView);
            },
            child: Text(
              'Login Now for more option!'.tr(context),
              style: const TextStyle(
                color: kLogoColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // CustomButon(
          //   height: null,
          //   padding: EdgeInsets.zero,
          //   radius: 8,
          //   background: Colors.white,
          //   textColor: kLogoColor,
          //   borderColor: kLogoColor,
          //   withBorder: true,
          //   text: 'Login Now for more option!'.tr(context),
          //   onPressed: () {
          //     GoRouter.of(context).push(AppRouter.kSignInView);
          //   },
          // ),
        ],
      ),
    );
  }
}
