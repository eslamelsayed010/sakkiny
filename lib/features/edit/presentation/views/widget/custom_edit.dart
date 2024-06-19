import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/features/edit/presentation/views/widget/image_property_section.dart';

class CustomEdit extends StatelessWidget {
  const CustomEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kSelectedView);
      },
      child: Column(
        children: const [
          ImagePropertySection(),
          // DetailsPropertySection(),
        ],
      ),
    );
  }
}
