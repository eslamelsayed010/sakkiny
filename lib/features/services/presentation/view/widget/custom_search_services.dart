import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_text_form_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            const Expanded(
              child: CustomTextFormField(
                contentPadding: EdgeInsets.all(15),
                radius: 50,
                isFilled: false,
                enabled: false,
                hintText: 'Search Your Services',
                hintColor: Colors.black,
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 5),
            FloatingActionButton(
              heroTag: 'arrow_up_wide_search',
              mini: true,
              backgroundColor: kLogoColor,
              onPressed: () {},
              child: const Icon(FontAwesomeIcons.arrowUpWideShort),
            )
          ],
        ),
      ),
    );
  }
}
