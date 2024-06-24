import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/assets.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_divider.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kSignInView);
      },
      child: Column(
        children: [
          const CustomDivider(paddingHorizontal: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(AssetsData.user),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Log In / Create Account'.tr(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kLogoColor,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: kLogoColor,
                ),
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kSignInView);
                },
              ),
            ],
          ),
          const CustomDivider(paddingHorizontal: 0),
        ],
      ),
    );
  }
}
