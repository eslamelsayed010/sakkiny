import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/widgets/custom_text_form_field.dart';
import 'package:sakkiny/features/search_services/presentation/manager/cubit/search_service_cubit.dart';
import 'package:sakkiny/features/search_services/presentation/views/widgets/search_services_bloc_builder/state_result_search_bloc_builder.dart';

class SearchServicesViewBody extends StatefulWidget {
  const SearchServicesViewBody({Key? key}) : super(key: key);

  @override
  State<SearchServicesViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchServicesViewBody> {
  var textController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: CustomTextFormField(
                    contentPadding: const EdgeInsets.all(15),
                    radius: 50,
                    isFilled: false,
                    controller: textController,
                    //labelText: 'Search Now',
                    hintText: 'Search Your Service'.tr(context),
                    validatorText: 'enter the name of Service !'.tr(context),
                    onFieldSubmitted: (data) {
                      if (formKey.currentState!.validate()) {
                        SearchserviceCubit.get(context)
                            .getSearchService(search: data);
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    suffixIconPressed: () {
                      if (formKey.currentState!.validate()) {
                        SearchserviceCubit.get(context)
                            .getSearchService(search: textController.text);
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const StateResultSearchServiceBlocBuilder(),
        ],
      ),
    );
  }
}
