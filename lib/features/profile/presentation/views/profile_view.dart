import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/about_section.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/call_section.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/edit_section.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/lang_section.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/login_section.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/share_section.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/user_profile_bloc_builder.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/verify_section.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            token == null
                ? const LoginSection()
                : const UserProfileBlocBuilder(),
            const SizedBox(height: 50),
            const LangSection(),
            const SizedBox(height: 30),
            const AboutSection(),
            const SizedBox(height: 30),
            const EditSection(),
            const SizedBox(height: 30),
            const VerifySection(),
            const SizedBox(height: 30),
            const ShareSection(),
            const SizedBox(height: 30),
            const CallSection(),
          ],
        ),
      ),
    );
  }
}
