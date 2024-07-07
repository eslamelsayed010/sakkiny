// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';
import 'package:sakkiny/core/widgets/custom_text_form_field.dart';
import 'package:sakkiny/core/widgets/show_toast.dart';
import 'package:sakkiny/features/verify/presentation/manger/verify_cubit/verify_cubit.dart';
import 'package:sakkiny/features/verify/presentation/manger/verify_cubit/verify_states.dart';
import 'package:sakkiny/features/verify/presentation/view/widgets/custom_camera_image.dart';
import 'package:sakkiny/features/verify/presentation/view/widgets/custom_verify_id_image.dart';
import 'package:sakkiny/features/verify/presentation/view/widgets/send_bloc_builder.dart';

class VerifyViewBody extends StatefulWidget {
  const VerifyViewBody({Key? key}) : super(key: key);

  @override
  State<VerifyViewBody> createState() => _VerifyViewBodyState();
}

class _VerifyViewBodyState extends State<VerifyViewBody> {
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  TextEditingController codeController = TextEditingController();

  File? selectedFrontImage;
  void handleFrontImageSelection(File image) {
    setState(() {
      selectedFrontImage = image;
    });
  }

  File? selectedBackImage;
  void handleBackImageSelection(File image) {
    setState(() {
      selectedBackImage = image;
    });
  }

  File? selectedCameraImage;
  void handleCameraImageSelection(File image) {
    setState(() {
      selectedCameraImage = image;
    });
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyCubit, VerifyStates>(
      listener: (context, state) {
        if (state is LoadingVerifyState) {
          isLoading = true;
        }
        if (state is SuccessVerifyState) {
          isLoading = false;
          if (state.verifyIdentityModel.status == true) {
            GoRouter.of(context).pop();
            showToast(
              txt: state.verifyIdentityModel.message!,
              state: ToastState.SUCCESS,
            );
          } else {
            showToast(
              txt: state.verifyIdentityModel.message!,
              state: ToastState.ERROR,
            );
          }
        }
        if (state is FailureVerifyState) {
          isLoading = false;
          showToast(txt: state.error, state: ToastState.ERROR);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SendCodeBlocBuilder(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .2),
                    child: CustomTextFormField(
                      controller: codeController,
                      hintText: 'Enter Your Code . . .'.tr(context),
                      validatorText: 'enter the code !!'.tr(context),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CustomVerifyIdImage(
                            txt: 'Enter photo of your ID card from front'
                                .tr(context),
                            onImageSelected: handleFrontImageSelection,
                          ),
                          const SizedBox(width: 10),
                          CustomVerifyIdImage(
                            txt: 'Enter photo of your ID card from back'
                                .tr(context),
                            onImageSelected: handleBackImageSelection,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCameraImage(
                          onImageSelected: handleCameraImageSelection),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Upload a picture from the camera'.tr(context)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButon(
                        isLoading: isLoading,
                        colorLoadingIndicator: kLogoColor,
                        background: Colors.white,
                        borderColor: kLogoColor,
                        withBorder: true,
                        textColor: kLogoColor,
                        radius: 8,
                        fontSize: 16,
                        text: 'Verify'.tr(context),
                        onPressed: () async {
                          if (formKey.currentState!.validate() &&
                              selectedFrontImage != null &&
                              selectedCameraImage != null &&
                              selectedBackImage != null) {
                            VerifyCubit.get(context).verifyIdentity(
                              code: codeController.text,
                              cameraImage: await MultipartFile.fromFile(
                                selectedCameraImage!.path,
                                filename: 'selectedCameraImage!.path',
                              ),
                              frontIDImage: await MultipartFile.fromFile(
                                selectedFrontImage!.path,
                                filename: 'selectedFrontImage!.path',
                              ),
                              backIDImage: await MultipartFile.fromFile(
                                selectedBackImage!.path,
                                filename: 'selectedBackImage!.path',
                              ),
                            );
                          } else {
                            autoValidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                          if (selectedFrontImage == null &&
                              selectedCameraImage == null &&
                              selectedBackImage == null) {
                            showToast(
                                txt: 'enter the images !'.tr(context),
                                state: ToastState.ERROR);
                          }
                        },
                      ),
                    ],
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
