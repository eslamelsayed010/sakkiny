import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/const.dart';

class CustomViewAll extends StatelessWidget {
  const CustomViewAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        TextButton(
          onPressed: () {
            // GoRouter.of(context).push(AppRouter.kViewAllListView);
          },
          child: Text(
            "View All".tr(context),
            style: const TextStyle(
              color: kLogoColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Icon(
          Icons.arrow_forward,
          color: kLogoColor,
          size: 20,
        ),
        const SizedBox(width: 10)
      ],
    );
  }
}
