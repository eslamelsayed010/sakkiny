import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';
import 'package:sakkiny/core/widgets/custom_text_form_field.dart';
import 'package:sakkiny/features/report/presentation/view/widgets/custom_report_image.dart';

class ReportViewBody extends StatefulWidget {
  const ReportViewBody({super.key});

  @override
  State<ReportViewBody> createState() => _ReportViewBodyState();
}

class _ReportViewBodyState extends State<ReportViewBody> {
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  bool isLoading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  File? selectedImage;
  void handleImageSelection(File image) {
    setState(() {
      selectedImage = image;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'For suggestions and inquiries'.tr(context),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'We welcome all inquiries and suggestions'.tr(context),
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 30),
              //name
              CustomTextFormField(
                colorText: Colors.black,
                controller: nameController,
                isFilled: false,
                labelText: 'Name'.tr(context),
                keyboardType: TextInputType.text,
                validatorText: 'enter your name !'.tr(context),
              ),
              const SizedBox(height: 30),
              //E-mail Address
              CustomTextFormField(
                colorText: Colors.black,
                controller: emailController,
                isFilled: false,
                labelText: 'E-mail Address'.tr(context),
                keyboardType: TextInputType.text,
                validatorText: 'enter your e-mail address !'.tr(context),
              ),
              const SizedBox(height: 30),
              //phone
              CustomTextFormField(
                colorText: Colors.black,
                controller: phoneController,
                isFilled: false,
                labelText: 'Phone'.tr(context),
                keyboardType: TextInputType.text,
                validatorText: 'enter your Phone !'.tr(context),
              ),
              const SizedBox(height: 30),
              //title
              CustomTextFormField(
                colorText: Colors.black,
                controller: titleController,
                isFilled: false,
                labelText: 'Title of message (optional)'.tr(context),
                keyboardType: TextInputType.text,
                //validatorText: 'enter title of message !'.tr(context),
              ),
              const SizedBox(height: 30),
              //message
              CustomTextFormField(
                colorText: Colors.black,
                controller: messageController,
                isFilled: false,
                labelText: 'Message'.tr(context),
                keyboardType: TextInputType.text,
                maxLines: 4,
                validatorText: 'Enter The Message !'.tr(context),
              ),
              const SizedBox(height: 30),
              //image
              CustomReportImage(
                onImageSelected: handleImageSelection,
                txt: 'Attachment (optional)'.tr(context),
              ),
              const SizedBox(height: 30),
              Text(
                'Please enter all data*'.tr(context),
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 10),
              CustomButon(
                isLoading: isLoading,
                text: 'Send'.tr(context),
                width: double.infinity,
                radius: 10,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
