// ignore_for_file: avoid_print

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/features/home/presentation/views/widget/custom_text.dart';
import 'package:sakkiny/features/profile/presentation/manger/lang_cubit/lang_cubit.dart';
import 'package:sakkiny/features/profile/presentation/manger/lang_cubit/lang_states.dart';

class LangViewBody extends StatelessWidget {
  const LangViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          CustomText(
            text: 'Language'.tr(context),
            color: Colors.black,
            fontSize: 18,
          ),
          BlocConsumer<LocaleCubit, ChangeLocaleState>(
            listener: (context, state) {
              // Navigator.of(context).pop();
            },
            builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                child: DropdownButton<String>(
                  value: state.locale.languageCode,
                  icon: Expanded(
                    child: Row(
                      children: const [
                        Spacer(),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                  items: ['ar', 'en'].map((String items) {
                    return DropdownMenuItem<String>(
                      value: items,
                      child: Text(items.tr(context)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      context.read<LocaleCubit>().changeLanguage(newValue);
                    }
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 70),
          CustomText(
            text: 'Country'.tr(context),
            color: Colors.black,
            fontSize: 18,
          ),
          const SizedBox(height: 10),
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
          // const CustomTextFormField(
          //   contentPadding: EdgeInsets.symmetric(horizontal: 10),
          //   labelText: 'Egypt(Elzagazig)',
          //   isFilled: false,
          //   drawBorder: true,
          //   suffixIcon: Icon(
          //     Icons.keyboard_arrow_down,
          //     color: Colors.black,
          //   ),
          // ),
        ],
      ),
    );
  }
}
