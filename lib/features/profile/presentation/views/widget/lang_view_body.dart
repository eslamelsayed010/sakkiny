import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/widgets/custom_text_form_field.dart';
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
              Navigator.of(context).pop();
            },
            builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                child: DropdownButton<String>(
                  value: state.locale.languageCode,
                  icon: const Icon(Icons.keyboard_arrow_down),
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
          const CustomTextFormField(
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
