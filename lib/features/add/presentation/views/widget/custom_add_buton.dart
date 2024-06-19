import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';

class CustomAddButon extends StatelessWidget {
  const CustomAddButon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButon(
            text: 'Add property'.tr(context),
            radius: 8,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kAddPropertyView);
            },
          ),
          CustomButon(
            text: 'Add Service'.tr(context),
            radius: 8,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kAddServiceView);
            },
          ),
        ],
      ),
    );
  }
}
