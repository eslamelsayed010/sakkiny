import 'package:flutter/material.dart';
import 'package:sakkiny/core/widgets/custom_text_form_field.dart';
import 'package:sakkiny/features/home/presentation/views/widget/custom_text.dart';

class LangViewBody extends StatelessWidget {
  const LangViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 50),
          CustomText(
            text: 'Language',
            color: Colors.black,
            fontSize: 18,
          ),
          CustomTextFormField(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            hintText: 'English',
            isFilled: false,
            drawBorder: true,
          ),
          SizedBox(height: 70),
          CustomText(
            text: 'Country',
            color: Colors.black,
            fontSize: 18,
          ),
          CustomTextFormField(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            hintText: 'Egypt(Elzagazig)',
            isFilled: false,
            drawBorder: true,
          ),
        ],
      ),
    );
  }
}
