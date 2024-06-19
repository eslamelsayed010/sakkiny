import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/widgets/custom_divider.dart';
import 'package:sakkiny/features/edit/presentation/views/widget/custom_edit.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/custom_profile_app_bar.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarProfile(context, 'Edit Your Property'.tr(context)),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              itemBuilder: (context, index) => const CustomEdit(),
              separatorBuilder: (context, index) => const CustomDivider(),
              itemCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
