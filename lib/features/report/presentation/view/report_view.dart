import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/custom_profile_app_bar.dart';
import 'package:sakkiny/features/report/presentation/view/widgets/report_view_body.dart';

class ReportView extends StatelessWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarProfile(
        context,
        'Call Us'.tr(context),
      ),
      body: const ReportViewBody(),
    );
  }
}
