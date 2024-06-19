import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_text_form_field.dart';
import 'package:sakkiny/features/search/presentation/mange/search_cubit.dart';
import 'package:sakkiny/features/search/presentation/views/widgets/search_bloc_builder/state_result_search_bloc_builder.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
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
                    hintText: 'Search Your Property'.tr(context),
                    validatorText: 'enter you want !'.tr(context),
                    onFieldSubmitted: (data) {
                      if (formKey.currentState!.validate()) {
                        SearchCubit.get(context).getSearch(search: data);
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    suffixIconPressed: () {
                      if (formKey.currentState!.validate()) {
                        SearchCubit.get(context)
                            .getSearch(search: textController.text);
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
                const SizedBox(width: 5),
                FloatingActionButton(
                  heroTag: 'arrow_up_wide_short_search',
                  mini: true,
                  backgroundColor: kLogoColor,
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kFilterView);
                  },
                  child: const Icon(FontAwesomeIcons.arrowUpWideShort),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const StateResultSearchBlocBuilder(),
        ],
      ),
    );
  }
}
