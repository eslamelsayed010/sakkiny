import 'package:flutter/material.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/about_section.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/edit_section.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/lang_section.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/login_section.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/share_section.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: const [
          SizedBox(height: 30),
          LoginSection(),
          SizedBox(height: 50),
          LangSection(),
          SizedBox(height: 30),
          AboutSection(),
          SizedBox(height: 30),
          EditSection(),
          SizedBox(height: 30),
          ShareSection(),
        ],
      ),
    );
  }
}
