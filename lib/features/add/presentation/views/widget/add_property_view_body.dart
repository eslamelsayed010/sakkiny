// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:csc_picker/csc_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';
import 'package:sakkiny/core/widgets/custom_text_form_field.dart';
import 'package:sakkiny/core/widgets/show_toast.dart';
import 'package:sakkiny/features/add/presentation/manger/add_property_cubit.dart';
import 'package:sakkiny/features/add/presentation/manger/add_property_state.dart';
import 'package:sakkiny/features/add/presentation/views/widget/bathroom_details.dart';
import 'package:sakkiny/features/add/presentation/views/widget/custom_chose_image.dart';
import 'package:sakkiny/features/add/presentation/views/widget/floor_details.dart';
import 'package:sakkiny/features/add/presentation/views/widget/rental_rate_details.dart';
import 'package:sakkiny/features/add/presentation/views/widget/search_map.text.dart';
import 'package:sakkiny/features/add/presentation/views/widget/text_field_details.dart';
import 'package:sakkiny/features/add/presentation/views/widget/type_property_details.dart';
import 'package:sakkiny/features/add/presentation/views/widget/who_are_you_list.dart';

class AddPropertyViewBody extends StatefulWidget {
  const AddPropertyViewBody({super.key});

  @override
  State<AddPropertyViewBody> createState() => _AddPropertyViewBodyState();
}

class _AddPropertyViewBodyState extends State<AddPropertyViewBody> {
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  List<XFile> selectedImages = [];
  TextEditingController priceController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController rentalController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController bathroomsController = TextEditingController();
  TextEditingController luxuriesController = TextEditingController();
  TextEditingController addedByTypeController = TextEditingController();
  double lang = 0;
  double lat = 0;
  bool isFurnished = true;
  bool isLoading = false;

  @override
  void dispose() {
    priceController.dispose();
    unitController.dispose();
    roomController.dispose();
    locationController.dispose();
    addressController.dispose();
    typeController.dispose();
    descController.dispose();
    floorController.dispose();
    bathroomsController.dispose();
    luxuriesController.dispose();
    super.dispose();
  }

  void handleImageSelection(List<XFile> images) {
    setState(() {
      selectedImages = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPropertyCubit, AddPropertyState>(
      listener: (context, state) {
        if (state is AddPropertyLoading) {
          isLoading = true;
        }
        if (state is AddPropertySuccess) {
          isLoading = false;
          if (state.addPropertyModel.status == true) {
            showToast(
              txt: state.addPropertyModel.message!,
              state: ToastState.SUCCESS,
            );
          } else {
            showToast(
              txt: state.addPropertyModel.message!,
              state: ToastState.ERROR,
            );
          }
          if (state.addPropertyModel.property!.userVerified! == false) {
            GoRouter.of(context).push(AppRouter.kVerifyView);
          }
        }
        if (state is AddPropertyFailure) {
          isLoading = false;
          showToast(
            txt: state.error,
            state: ToastState.ERROR,
          );
        }
      },
      builder: (context, state) {
        AddPropertyCubit cubit = AddPropertyCubit.get(context);
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
                  //is furnished
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Furnished'.tr(context),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isFurnished = true;
                              });
                            },
                            child: Material(
                              elevation: 4,
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: isFurnished
                                      ? kLogoColor
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: Colors.black26),
                                ),
                                child: Text(
                                  'Yes'.tr(context),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: isFurnished
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 40),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isFurnished = false;
                              });
                            },
                            child: Material(
                              elevation: 4,
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: isFurnished
                                      ? Colors.transparent
                                      : kLogoColor,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: Colors.black26),
                                ),
                                child: Text(
                                  'No'.tr(context),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: isFurnished
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  //added by
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: addedByTypeController,
                    isFilled: false,
                    labelText: 'who are you ?'.tr(context),
                    keyboardType: TextInputType.number,
                    suffixIcon: const Icon(Icons.arrow_forward_ios),
                    validatorText: 'who are you ?!!'.tr(context),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return WhoAreYouList(
                              controller: addedByTypeController);
                        }),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  //price
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: priceController,
                    isFilled: false,
                    labelText: 'Price'.tr(context),
                    keyboardType: TextInputType.number,
                    validatorText: 'Enter The Price !!'.tr(context),
                  ),
                  const SizedBox(height: 30),
                  //rental
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: rentalController,
                    isFilled: false,
                    labelText: 'Rental rate'.tr(context),
                    keyboardType: TextInputType.number,
                    suffixIcon: const Icon(Icons.arrow_forward_ios),
                    validatorText: 'Enter Rental rate !!'.tr(context),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return RentalDetails(controller: rentalController);
                        }),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  //Unit Area
                  CustomTextFormField(
                    onTap: () {},
                    colorText: Colors.black,
                    controller: unitController,
                    isFilled: false,
                    labelText: 'Unit Area'.tr(context),
                    keyboardType: TextInputType.number,
                    validatorText: 'Enter The Unit Area !!'.tr(context),
                  ),
                  const SizedBox(height: 30),
                  //bedrooms
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: roomController,
                    isFilled: false,
                    labelText: 'Bedrooms'.tr(context),
                    keyboardType: TextInputType.number,
                    validatorText: 'Enter Number Of Bedrooms !!'.tr(context),
                  ),
                  const SizedBox(height: 30),
                  //floor
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: floorController,
                    isFilled: false,
                    labelText: 'Floor'.tr(context),
                    suffixIcon: const Icon(Icons.arrow_forward_ios),
                    keyboardType: TextInputType.number,
                    validatorText: 'Enter Floor !!'.tr(context),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return FloorDetails(
                            fController: floorController,
                          );
                        }),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  //Bathrooms
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: bathroomsController,
                    isFilled: false,
                    labelText: 'Bathrooms'.tr(context),
                    suffixIcon: const Icon(Icons.arrow_forward_ios),
                    keyboardType: TextInputType.number,
                    validatorText: 'Enter number of bathrooms !!'.tr(context),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return BathroomsDetails(
                            bController: bathroomsController,
                          );
                        }),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  //luxuries
                  CustomTextFormField(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return TextFieldDetails(
                            controllerOfList: luxuriesController,
                          );
                        }),
                      );
                    },
                    colorText: Colors.black,
                    controller: luxuriesController,
                    suffixIcon: const Icon(Icons.arrow_forward_ios),
                    isFilled: false,
                    labelText: 'Luxuries'.tr(context),
                    keyboardType: TextInputType.number,
                    validatorText: 'Enter Luxuries !!'.tr(context),
                  ),
                  const SizedBox(height: 30),
                  //address
                  CSCPicker(
                    countryDropdownLabel: 'country'.tr(context),
                    cityDropdownLabel: 'city'.tr(context),
                    stateDropdownLabel: 'state'.tr(context),
                    layout: Layout.vertical,
                    flagState: CountryFlag.ENABLE,
                    onCountryChanged: (onCountryChanged) {
                      print(onCountryChanged.toString());
                    },
                    onCityChanged: (onCityChanged) {},
                    onStateChanged: (onStateChanged) {},
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: addressController,
                    isFilled: false,
                    labelText: 'Address'.tr(context),
                    keyboardType: TextInputType.text,
                    validatorText: 'Enter The Address !!'.tr(context),
                  ),
                  const SizedBox(height: 30),
                  //location
                  CustomTextFormField(
                    onTap: () async {
                      Map<String, dynamic>? result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const MapSearchPage();
                        }),
                      );
                      if (result != null) {
                        locationController.text = result['city_name'];
                        lat = result['latLng'].latitude;
                        lang = result['latLng'].longitude;
                        // 'Latitude: ${result.latitude}, Longitude: ${result.longitude}';
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
                  //Image
                  CustomChoseImage(onImagesSelected: handleImageSelection),
                  const SizedBox(height: 30),
                  //type
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: typeController,
                    isFilled: false,
                    suffixIcon: const Icon(Icons.arrow_forward_ios),
                    labelText: 'Your property type'.tr(context),
                    keyboardType: TextInputType.text,
                    validatorText: 'Enter Your property type !!'.tr(context),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return TypeDetails(controller: typeController);
                        }),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  //description
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
                    text: 'Add My Property'.tr(context),
                    width: double.infinity,
                    radius: 10,
                    onPressed: () async {
                      if (formKey.currentState!.validate() &&
                          selectedImages.isNotEmpty) {
                        cubit.addProperty(
                          type: typeController.text,
                          description: descController.text,
                          bedrooms: int.tryParse(roomController.text) ?? 0,
                          bathrooms:
                              int.tryParse(bathroomsController.text) ?? 0,
                          details: luxuriesController.text,
                          level: floorController.text,
                          area: int.tryParse(unitController.text) ?? 0,
                          price:
                              double.tryParse(priceController.text)?.toInt() ??
                                  0,
                          per: rentalController.text,
                          isFurnished: isFurnished,
                          address: addressController.text,
                          propertyImages: await Future.wait(
                            selectedImages.map(
                              (image) async => await MultipartFile.fromFile(
                                image.path,
                                filename: image.name,
                              ),
                            ),
                          ),
                          lang: lang,
                          lat: lat,
                          addedByType: addedByTypeController.text,
                        );
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                      if (selectedImages.isEmpty) {
                        showToast(
                            txt: 'Choose from gallery five image at least'
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
