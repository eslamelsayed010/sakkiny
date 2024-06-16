// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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
                    labelText: 'Price',
                    keyboardType: TextInputType.number,
                    validatorText: 'Enter The Price !!',
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
                        lat = result['latLng'].latitude;
                        lang = result['latLng'].longitude;
                      }
                    },
                    colorText: Colors.black,
                    controller: locationController,
                    isFilled: false,
                    labelText: 'Location',
                    keyboardType: TextInputType.text,
                    validatorText: 'Enter The Location !!',
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
                    labelText: 'Type Your Service',
                    keyboardType: TextInputType.text,
                    validatorText: 'Enter The Type Your Service !!',
                  ),
                  const SizedBox(height: 30),
                  // address
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: addressController,
                    isFilled: false,
                    labelText: 'Address',
                    keyboardType: TextInputType.text,
                    validatorText: 'Enter  Your Address !!',
                  ),
                  const SizedBox(height: 30),
                  // description
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: descController,
                    isFilled: false,
                    labelText: 'Description',
                    keyboardType: TextInputType.text,
                    maxLines: 4,
                    validatorText: 'Enter The Description !!',
                  ),
                  const SizedBox(height: 30),
                  CustomButon(
                    isLoading: isLoading,
                    text: 'Add My Service',
                    width: double.infinity,
                    radius: 10,
                    onPressed: () async {
                      print(priceController.text);
                      print(typeController.text);
                      print(descController.text);
                      print(addressController.text);
                      print(lang);
                      print(lat);
                      print(selectedImages);

                      if (formKey.currentState!.validate()) {
                        cubit.addService(
                          price:
                              double.tryParse(priceController.text)?.toInt() ??
                                  0, // Convert double to int
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
