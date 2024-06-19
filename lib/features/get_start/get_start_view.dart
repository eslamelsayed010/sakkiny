import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/assets.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';

class GetStartView extends StatelessWidget {
  const GetStartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Spacer(),
          Image.asset(
            AssetsData.stackGetStart,
            height: 400,
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Text(
                    'Find Your Dream House'.tr(context),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kLogoColor,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          CustomButon(
            text: "Let's started".tr(context),
            width: double.infinity,
            marginHorizontal: 10,
            marginBottom: 30,
            background: kLogoColor,
            withBorder: false,
            radius: 50,
            addLogo: true,
            itemLogo: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSignInView);
            },
          ),
        ],
      ),
    );
  }
}
