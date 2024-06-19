import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';
import 'package:sakkiny/core/widgets/custom_text_form_field.dart';
import 'package:sakkiny/features/user/presentation/widgets/custom_profile_image.dart';

class PersonViewBody extends StatefulWidget {
  const PersonViewBody({Key? key}) : super(key: key);

  @override
  State<PersonViewBody> createState() => _PersonViewBodyState();
}

class _PersonViewBodyState extends State<PersonViewBody> {
  String? name, phone;
  TextEditingController? nameController;
  TextEditingController? phoneController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const CustomProfileImage(),
              const SizedBox(height: 30),
              CustomTextFormField(
                keyboardType: TextInputType.name,
                controller: nameController,
                suffixIcon: const Icon(Icons.person),
                labelText: 'Name'.tr(context),
                colorText: Colors.black,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                keyboardType: TextInputType.phone,
                controller: phoneController,
                suffixIcon: const Icon(Icons.phone),
                labelText: 'Phone'.tr(context),
                colorText: Colors.black,
              ),
              const SizedBox(height: 30),
              CustomButon(
                background: Colors.white,
                width: double.infinity,
                borderColor: kLogoColor,
                withBorder: true,
                textColor: kLogoColor,
                radius: 8,
                fontSize: 16,
                text: 'Update'.tr(context),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
