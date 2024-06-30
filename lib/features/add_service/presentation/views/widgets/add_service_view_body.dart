// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';
import 'package:sakkiny/core/widgets/custom_text_form_field.dart';
import 'package:sakkiny/core/widgets/show_toast.dart';
import 'package:sakkiny/features/add_service/presentation/manager/cubit/add_service_cubit.dart';
import 'package:sakkiny/features/add_service/presentation/manager/cubit/add_service_state.dart';
import 'package:sakkiny/features/add_service/presentation/views/widgets/custom_service_image.dart';
import 'package:sakkiny/features/add_service/presentation/views/widgets/map_service.dart';
import 'package:sakkiny/features/add_service/presentation/views/widgets/service_details.dart';

class AddServicesViewBody extends StatefulWidget {
  const AddServicesViewBody({super.key});

  @override
  State<AddServicesViewBody> createState() => _AddServicesViewBodyState();
}

class _AddServicesViewBodyState extends State<AddServicesViewBody> {
  var formKey = GlobalKey<FormState>();
  List<XFile> selectedImages = [];

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  double lang = 0;
  double lat = 0;
  bool isLoading = false;

  @override
  void dispose() {
    priceController.dispose();
    locationController.dispose();
    typeController.dispose();
    descController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void handleImageSelection(List<XFile> imagePaths) {
    setState(() {
      selectedImages = imagePaths;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddServiceCubit, AddServiceState>(
      listener: (context, state) {
        if (state is AddServiceLoading) {
          setState(() {
            isLoading = true;
          });
        }
        if (state is AddServiceSuccess) {
          setState(() {
            isLoading = false;
          });
          showToast(
            txt: state.serviceModel.message!,
            state: ToastState.SUCCESS,
          );
          if (state.serviceModel.service!.userVerified == false) {
            GoRouter.of(context).push(AppRouter.kVerifyView);
          }
        } else if (state is AddServiceFailure) {
          setState(() {
            isLoading = false;
          });
          showToast(
            txt: state.error,
            state: ToastState.ERROR,
          );
          print('Failure: ${state.error}');
        }
      },
      builder: (context, state) {
        AddServiceCubit cubit = AddServiceCubit.get(context);
        return Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 20,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // price
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: priceController,
                    isFilled: false,
                    labelText: 'Price'.tr(context),
                    keyboardType: TextInputType.number,
                    validatorText: 'Enter The Price !!'.tr(context),
                  ),
                  const SizedBox(height: 30),
                  // location
                  CustomTextFormField(
                    onTap: () async {
                      Map<String, dynamic>? result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const MapServicePage();
                        }),
                      );
                      if (result != null) {
                        locationController.text = result['city_name'];
                        // locationController.text = 'city_name';
                        lat = result['latLng'].latitude;
                        lang = result['latLng'].longitude;
                      }
                    },
                    colorText: Colors.black,
                    controller: locationController,
                    isFilled: false,
                    labelText: 'Location'.tr(context),
                    keyboardType: TextInputType.text,
                    validatorText: 'Enter The Location !!'.tr(context),
                  ),
                  const SizedBox(height: 30),
                  // Image
                  CustomServiceImage(onImagesSelected: handleImageSelection),
                  const SizedBox(height: 30),
                  // type
                  CustomTextFormField(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return ServiceDetails(controller: typeController);
                        }),
                      );
                    },
                    colorText: Colors.black,
                    controller: typeController,
                    isFilled: false,
                    labelText: 'Your Service Type'.tr(context),
                    keyboardType: TextInputType.text,
                    validatorText: 'Enter Your Service Type !!'.tr(context),
                  ),
                  const SizedBox(height: 30),
                  // address
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: addressController,
                    isFilled: false,
                    labelText: 'Address'.tr(context),
                    keyboardType: TextInputType.text,
                    validatorText: 'Enter Your Address !!'.tr(context),
                  ),
                  const SizedBox(height: 30),
                  // description
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: descController,
                    isFilled: false,
                    labelText: 'Description'.tr(context),
                    keyboardType: TextInputType.text,
                    maxLines: 4,
                    validatorText: 'Enter The Description !!'.tr(context),
                  ),
                  const SizedBox(height: 30),
                  CustomButon(
                    isLoading: isLoading,
                    text: 'Add My Service'.tr(context),
                    width: double.infinity,
                    radius: 10,
                    onPressed: () async {
                      if (formKey.currentState!.validate() &&
                          selectedImages.isNotEmpty) {
                        cubit.addService(
                          price: double.tryParse(priceController.text)!.toInt(),
                          serviceCategory: typeController.text,
                          address: addressController.text,
                          lat: lat,
                          long: lang,
                          propertyImages: await Future.wait(
                            selectedImages.map(
                              (image) async => await MultipartFile.fromFile(
                                image.path,
                                filename: image.name,
                              ),
                            ),
                          ),
                          description: descController.text,
                        );
                      } else {
                        setState(() {
                          autoValidateMode = AutovalidateMode.always;
                        });
                      }
                      if (selectedImages.isEmpty) {
                        showToast(
                            txt: 'Choose from the gallery images that express your services'
                                .tr(context),
                            state: ToastState.ERROR);
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
