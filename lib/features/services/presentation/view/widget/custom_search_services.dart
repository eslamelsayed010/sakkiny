import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/widgets/custom_text_form_field.dart';

class CustomSearchServices extends StatelessWidget {
  const CustomSearchServices({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kSearchServicesView);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CustomTextFormField(
                contentPadding: const EdgeInsets.all(15),
                radius: 50,
                isFilled: false,
                enabled: false,
                hintText: 'Search Your Services'.tr(context),
                hintColor: Colors.black,
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
