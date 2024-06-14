import 'package:flutter/material.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';
import 'package:sakkiny/core/widgets/custom_text_form_field.dart';
import 'package:sakkiny/features/add/presentation/views/widget/custom_furnished.dart';
import 'package:sakkiny/features/edit/presentation/views/widget/custom_edit_image.dart';

class EditPropertyViewBody extends StatefulWidget {
  const EditPropertyViewBody({super.key});

  @override
  State<EditPropertyViewBody> createState() => _EditPropertyViewBody();
}

class _EditPropertyViewBody extends State<EditPropertyViewBody> {
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  TextEditingController priceController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void dispose() {
    priceController.dispose();
    unitController.dispose();
    roomController.dispose();
    locationController.dispose();
    phoneController.dispose();
    typeController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              const CustomEditImage(),
              const SizedBox(height: 30),
              const CustomFurnished(),
              const SizedBox(height: 30),
              CustomTextFormField(
                colorText: Colors.black,
                controller: priceController,
                isFilled: false,
                labelText: 'Price',
                keyboardType: TextInputType.number,
                validatorText: 'Enter The Price !!',
              ),
              const SizedBox(height: 30),
              CustomTextFormField(
                colorText: Colors.black,
                controller: unitController,
                isFilled: false,
                labelText: 'Unit Area',
                keyboardType: TextInputType.number,
                validatorText: 'Enter The Unit Area !!',
              ),
              const SizedBox(height: 30),
              CustomTextFormField(
                colorText: Colors.black,
                controller: roomController,
                isFilled: false,
                labelText: 'Number Of Rooms',
                keyboardType: TextInputType.number,
                validatorText: 'Enter The Number Of Rooms !!',
              ),
              const SizedBox(height: 30),
              CustomTextFormField(
                colorText: Colors.black,
                controller: locationController,
                isFilled: false,
                labelText: 'Location',
                keyboardType: TextInputType.text,
                validatorText: 'Enter The Location !!',
              ),
              const SizedBox(height: 30),
              CustomTextFormField(
                colorText: Colors.black,
                controller: phoneController,
                isFilled: false,
                labelText: 'Phone',
                keyboardType: TextInputType.phone,
                validatorText: 'Enter The Phone !!',
              ),
              const SizedBox(height: 30),
              CustomTextFormField(
                colorText: Colors.black,
                controller: typeController,
                isFilled: false,
                labelText: 'Type Your Property',
                keyboardType: TextInputType.text,
                validatorText: 'Enter The Type Your Property !!',
              ),
              const SizedBox(height: 30),
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
                text: 'Edit My Property',
                width: double.infinity,
                radius: 10,
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              CustomButon(
                background: Colors.red,
                text: 'Delete My Property',
                width: double.infinity,
                radius: 10,
                onPressed: () {},
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
