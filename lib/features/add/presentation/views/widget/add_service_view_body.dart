import 'package:flutter/material.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';
import 'package:sakkiny/core/widgets/custom_text_form_field.dart';

class AddServiceViewBody extends StatefulWidget {
  const AddServiceViewBody({super.key});

  @override
  State<AddServiceViewBody> createState() => _AddServiceViewBodyState();
}

class _AddServiceViewBodyState extends State<AddServiceViewBody> {
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController descController = TextEditingController();

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
              //const CustomChoseImage(onImagesSelected: (List<XFile> ) {  },),
              const SizedBox(height: 30),
              CustomTextFormField(
                colorText: Colors.black,
                controller: typeController,
                isFilled: false,
                labelText: 'Type Your Service',
                keyboardType: TextInputType.text,
                validatorText: 'Enter The Type Your Service !!',
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
                text: 'Add My Service',
                width: double.infinity,
                radius: 10,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
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
  }
}
