import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/custom_container_bottom.dart';

class ShareSection extends StatelessWidget {
  const ShareSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainerBottom(
      onTap: () {},
      text: 'Share App'.tr(context),
      firstIcon: Icons.share_outlined,
    );
  }
}
