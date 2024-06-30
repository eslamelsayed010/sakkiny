import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_divider.dart';
import 'package:sakkiny/features/home/presentation/views/widget/bloc_builder/property_bloc_builder.dart';
import 'package:sakkiny/features/home/presentation/views/widget/bloc_builder/recommended_hose_bloc_builder.dart';
import 'package:sakkiny/features/home/presentation/views/widget/bloc_builder/user_bloc_builder.dart';
import 'package:sakkiny/features/home/presentation/views/widget/custom_login.dart';
import 'package:sakkiny/features/home/presentation/views/widget/custom_search.dart';
import 'package:sakkiny/features/home/presentation/views/widget/custom_text.dart';
import 'package:sakkiny/features/home/presentation/views/widget/custom_view_all.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          token != null ? const UserBlocBuilder() : const CustomLogin(),
          const CustomSearch(),
          const SizedBox(height: 10),
          const CustomViewAll(),
          const SizedBox(height: 5),
          const PropertyBlocBuilder(),
          const CustomDivider(),
          CustomText(text: 'Recommended'.tr(context)),
          const CustomViewAll(),
          const SizedBox(height: 5),
          const RecommendedHoseBlocBuilder(),
        ],
      ),
    );
  }
}
