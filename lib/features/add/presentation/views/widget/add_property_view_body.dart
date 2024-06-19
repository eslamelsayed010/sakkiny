import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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
                  //is furnished
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Furnished',
                        style: TextStyle(
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
                                  'Yes',
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
                                  'No',
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
                  //price
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: priceController,
                    isFilled: false,
                    labelText: 'Price',
                    keyboardType: TextInputType.number,
                    validatorText: 'Enter The Price !!',
                  ),
                  const SizedBox(height: 30),
                  //rental
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: rentalController,
                    isFilled: false,
                    labelText: 'Rental rate',
                    keyboardType: TextInputType.number,
                    suffixIcon: const Icon(Icons.arrow_forward_ios),
                    validatorText: 'Enter Rental rate !!',
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
                    labelText: 'Unit Area',
                    keyboardType: TextInputType.number,
                    validatorText: 'Enter The Unit Area !!',
                  ),
                  const SizedBox(height: 30),
                  //bedrooms
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: roomController,
                    isFilled: false,
                    labelText: 'Bedrooms',
                    keyboardType: TextInputType.number,
                    validatorText: 'Enter Number Of Bedrooms !!',
                  ),
                  const SizedBox(height: 30),
                  //floor
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: floorController,
                    isFilled: false,
                    labelText: 'Floor',
                    suffixIcon: const Icon(Icons.arrow_forward_ios),
                    keyboardType: TextInputType.number,
                    validatorText: 'Enter Floor !!',
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
                    labelText: 'Bathrooms',
                    suffixIcon: const Icon(Icons.arrow_forward_ios),
                    keyboardType: TextInputType.number,
                    validatorText: 'Enter Bathrooms !!',
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
                    labelText: 'Luxuries',
                    keyboardType: TextInputType.number,
                    validatorText: 'Enter Luxuries!!',
                  ),
                  const SizedBox(height: 30),
                  //address
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: addressController,
                    isFilled: false,
                    labelText: 'Address',
                    keyboardType: TextInputType.text,
                    validatorText: 'Enter The Address!!',
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
                    labelText: 'Location',
                    keyboardType: TextInputType.text,
                    validatorText: 'Enter The Location !!',
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
                    labelText: 'Type Your Property',
                    keyboardType: TextInputType.text,
                    validatorText: 'Enter The Type Your Property !!',
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
                    labelText: 'Description',
                    keyboardType: TextInputType.text,
                    maxLines: 4,
                    validatorText: 'Enter The Description !!',
                  ),
                  const SizedBox(height: 30),
                  CustomButon(
                    isLoading: isLoading,
                    text: 'Add My Property',
                    width: double.infinity,
                    radius: 10,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
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
                        );
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                        setState(() {});
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
