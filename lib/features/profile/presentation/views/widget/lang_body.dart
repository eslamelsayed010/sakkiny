import 'package:flutter/material.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/custom_profile_app_bar.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/lang_view_body.dart';

class LangView extends StatelessWidget {
  const LangView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Language / Country'),
      body: const LangViewBody(),
    );
  }
}
