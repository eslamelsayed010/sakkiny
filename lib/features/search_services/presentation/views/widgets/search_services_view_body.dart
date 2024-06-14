import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_text_form_field.dart';
import 'package:sakkiny/features/search_services/presentation/views/widgets/no_result_search.dart';

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
                    hintText: 'Search Your Service',
                    validatorText: 'enter the name of Service !',
                    onFieldSubmitted: (data) {
                      // if (formKey.currentState!.validate()) {
                      //   SearchCubit.get(context).fetchSearchMovie(movieName: data);
                      // } else {
                      //   autoValidateMode = AutovalidateMode.always;
                      //   setState(() {});
                      // }
                    },
                    suffixIconPressed: () {
                      // if (formKey.currentState!.validate()) {
                      //   SearchCubit.get(context)
                      //       .fetchSearchMovie(movieName: textController.text);
                      // } else {
                      //   autoValidateMode = AutovalidateMode.always;
                      //   setState(() {});
                      // }
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
          const NoResultSearchServices(),
        ],
      ),
    );
  }
}
