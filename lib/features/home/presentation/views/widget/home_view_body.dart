import 'package:flutter/material.dart';
import 'package:sakkiny/core/widgets/custom_divider.dart';
import 'package:sakkiny/features/home/presentation/views/widget/bloc_builder/property_bloc_builder.dart';
import 'package:sakkiny/features/home/presentation/views/widget/bloc_builder/recommended_hose_bloc_builder.dart';
import 'package:sakkiny/features/home/presentation/views/widget/custom_app_bar_home.dart';
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
        children: const [
          CustomAppBarHome(),
          CustomSearch(),
          SizedBox(height: 10),
          CustomViewAll(),
          SizedBox(height: 5),
          PropertyBlocBuilder(),
          CustomDivider(),
          CustomText(text: 'Recommended'),
          CustomViewAll(),
          SizedBox(height: 5),
          RecommendedHoseBlocBuilder(),
        ],
      ),
    );
  }
}
