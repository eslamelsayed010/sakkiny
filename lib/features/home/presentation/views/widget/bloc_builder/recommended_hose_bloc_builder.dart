import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/widgets/custom_error_widget.dart';
import 'package:sakkiny/features/home/presentation/manger/recommended_cubit/recommended_cubit.dart';
import 'package:sakkiny/features/home/presentation/manger/recommended_cubit/recommended_states.dart';
import 'package:sakkiny/features/home/presentation/views/widget/list_view_recommended_house.dart';
import 'package:sakkiny/features/home/presentation/views/widget/loading_indicator/list_view_home_loading_indicator.dart';

class RecommendedHoseBlocBuilder extends StatelessWidget {
  const RecommendedHoseBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedCubit, RecommendedStates>(
      builder: (context, state) {
        if (state is SuccessRecommendedState) {
          if (state.properties.isEmpty) {
            return CustomErrorWidget(
                errorMassage:
                    "No properties have been added yet..".tr(context));
          } else {
            return ListViewRecommendedHose(properties: state.properties);
          }
        } else if (state is FailureRecommendedState) {
          return CustomErrorWidget(errorMassage: state.error);
        } else {
          return const ListViewHomeLoadingIndicator();
        }
      },
    );
  }
}
