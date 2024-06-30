// ignore_for_file: avoid_print

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';
import 'package:sakkiny/core/widgets/custom_text_form_field.dart';
import 'package:sakkiny/core/widgets/show_toast.dart';
import 'package:sakkiny/features/home/data/models/user_model/user_model.dart';
import 'package:sakkiny/features/user/presentation/manger/cubit/update_user_cubit.dart';
import 'package:sakkiny/features/user/presentation/manger/cubit/update_user_state.dart';
import 'package:sakkiny/features/user/presentation/widgets/custom_profile_image.dart';

class PersonViewBody extends StatefulWidget {
  const PersonViewBody({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;

  @override
  State<PersonViewBody> createState() => _PersonViewBodyState();
}

class _PersonViewBodyState extends State<PersonViewBody> {
  TextEditingController? nameController;
  TextEditingController? phoneController;
  bool isLoading = false;

  File? selectedImage;
  void handleImageSelection(File image) {
    setState(() {
      selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserCubit, UpdateUserStates>(
      listener: (context, state) {
        if (state is UpdateUserStatesLoading) {
          isLoading = true;
        }
        if (state is UpdateUserStatesSuccess) {
          isLoading = false;
          showToast(
            txt: state.userModelInfo.message!,
            state: ToastState.SUCCESS,
          );
        }
        if (state is UpdateUserStatesFailure) {
          isLoading = false;
          showToast(
            txt: state.error,
            state: ToastState.ERROR,
          );
        }
      },
      builder: (context, state) {
        UpdateUserCubit cubit = UpdateUserCubit.get(context);
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  CustomProfileImage(
                    onImageSelected: handleImageSelection,
                    image: widget.userModel.user!.profilePicture!.secureUrl!,
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    suffixIcon: const Icon(Icons.person),
                    labelText: 'Name'.tr(context),
                    colorText: Colors.black,
                    hintText: widget.userModel.user!.name!,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    suffixIcon: const Icon(Icons.phone),
                    labelText: 'Phone'.tr(context),
                    colorText: Colors.black,
                    hintText: widget.userModel.user!.phoneNumber!,
                  ),
                  const SizedBox(height: 30),
                  CustomButon(
                    isLoading: isLoading,
                    colorLoadingIndicator: kLogoColor,
                    background: Colors.white,
                    width: double.infinity,
                    borderColor: kLogoColor,
                    withBorder: true,
                    textColor: kLogoColor,
                    radius: 8,
                    fontSize: 16,
                    text: 'Update'.tr(context),
                    onPressed: () async {
                      print(widget.userModel.user!.email!);
                      if (selectedImage != null) {
                        cubit.fetchUserInfo(
                          profileImage: await MultipartFile.fromFile(
                            selectedImage!.path,
                            filename: 'selectedImage!.path',
                          ),
                        );
                      } else {
                        showToast(
                            txt: 'Choose image from gallery for update'
                                .tr(context),
                            state: ToastState.ERROR);
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
