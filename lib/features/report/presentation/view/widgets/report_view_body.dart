import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';
import 'package:sakkiny/core/widgets/custom_text_form_field.dart';
import 'package:sakkiny/core/widgets/show_toast.dart';
import 'package:sakkiny/features/report/presentation/manger/report_cubit.dart';
import 'package:sakkiny/features/report/presentation/manger/report_states.dart';
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
    return BlocConsumer<ReportCubit, ReportStates>(
      listener: (context, state) {
        if (state is LoadingReportState) {
          isLoading = true;
        }
        if (state is SuccessReportState) {
          isLoading = false;
          if (state.reportModel.status == false) {
            showToast(
              txt: state.reportModel.message!,
              state: ToastState.ERROR,
            );
          } else {
            showToast(
              txt: state.reportModel.message!,
              state: ToastState.SUCCESS,
            );
          }
        }
        if (state is FailureReportState) {
          isLoading = false;
          showToast(
            txt: state.error,
            state: ToastState.ERROR,
          );
        }
      },
      builder: (context, state) {
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
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        if (selectedImage == null) {
                          ReportCubit.get(context).sendReport(
                            name: nameController.text,
                            email: emailController.text,
                            subject: titleController.text,
                            message: messageController.text,
                            contactNumber: phoneController.text,
                          );
                        } else {
                          ReportCubit.get(context).sendReport(
                            name: nameController.text,
                            email: emailController.text,
                            subject: titleController.text,
                            message: messageController.text,
                            contactNumber: phoneController.text,
                            image: await MultipartFile.fromFile(
                              selectedImage!.path,
                              filename: 'selectedImage!.path',
                            ),
                          );
                        }
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
