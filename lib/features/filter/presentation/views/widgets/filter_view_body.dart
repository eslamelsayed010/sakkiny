// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';
import 'package:sakkiny/features/filter/presentation/mange/filter_cubit.dart';
import 'package:sakkiny/features/home/presentation/views/widget/custom_text.dart';

class FilterViewBody extends StatefulWidget {
  const FilterViewBody({Key? key}) : super(key: key);

  @override
  State<FilterViewBody> createState() => _FilterViewBodyState();
}

class _FilterViewBodyState extends State<FilterViewBody> {
  int selectedPropertyType = 0;
  List<String> optionsPropertyType = [
    'apartment',
    'room',
    'villa',
  ];
  int selectedRentType = 0;
  List<String> optionsRentType = [
    'daily',
    'weekly',
    'monthly',
  ];
  RangeValues priceRange = const RangeValues(1000, 5000);
  RangeValues unitAreaRange = const RangeValues(90, 250);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          CustomText(
            text: 'Property Type'.tr(context),
            fontSize: 16,
            color: Colors.black,
          ),
          const SizedBox(height: 15),
          // Property Type List
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: optionsPropertyType.map((String option) {
                int index = optionsPropertyType.indexOf(option);
                return Row(
                  children: [
                    Radio(
                      value: index,
                      groupValue: selectedPropertyType,
                      activeColor: kLogoColor,
                      onChanged: (int? value) {
                        setState(() {
                          selectedPropertyType = value!;
                          //debugPrint(options[selectedOption]);
                        });
                      },
                    ),
                    Text(option.tr(context)),
                  ],
                );
              }).toList(),
            ),
          ),
          const Spacer(),
          CustomText(
            text: 'Rent Type'.tr(context),
            fontSize: 16,
            color: Colors.black,
          ),
          const SizedBox(height: 15),
          // Rent Type List
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: optionsRentType.map((String option) {
                int index = optionsRentType.indexOf(option);
                return Row(
                  children: [
                    Radio(
                      value: index,
                      groupValue: selectedRentType,
                      activeColor: kLogoColor,
                      onChanged: (int? value) {
                        setState(() {
                          selectedRentType = value!;
                          //debugPrint(options[selectedOption]);
                        });
                      },
                    ),
                    Text(option.tr(context)),
                    // const SizedBox(width: 30)
                  ],
                );
              }).toList(),
            ),
          ),
          const Spacer(),
          CustomText(
            text: 'Price Range'.tr(context),
            fontSize: 16,
            color: Colors.black,
          ),
          // Price Range
          Column(
            children: [
              RangeSlider(
                  values: priceRange,
                  min: 100,
                  max: 10000,
                  onChanged: (values) {
                    setState(() {
                      priceRange = values;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${priceRange.start.toInt()}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      " LE".tr(context),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "${priceRange.end.toInt()}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      " LE".tr(context),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          CustomText(
            text: 'Unit Area'.tr(context),
            fontSize: 16,
            color: Colors.black,
          ),
          // Unit Area Range
          Column(
            children: [
              RangeSlider(
                values: unitAreaRange,
                min: 70,
                max: 300,
                onChanged: (values) {
                  setState(() {
                    unitAreaRange = values;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${unitAreaRange.start.toInt()}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      " Meter".tr(context),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "${unitAreaRange.end.toInt()}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' Meter'.tr(context),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButon(
                onPressed: () {
                  FilterCubit.get(context).getFilterSearch(
                    priceGte: priceRange.start.toInt(),
                    priceLte: priceRange.end.toInt(),
                    areaGte: unitAreaRange.start.toInt(),
                    areaLte: unitAreaRange.end.toInt(),
                    type: optionsPropertyType[selectedPropertyType],
                    per: optionsRentType[selectedRentType],
                  );
                },
                text: 'Apply Filter'.tr(context),
                radius: 8,
              )
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
