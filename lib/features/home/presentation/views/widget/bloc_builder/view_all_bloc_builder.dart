import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/widgets/custom_error_widget.dart';
import 'package:sakkiny/features/home/presentation/manger/property_cubit/property_cubit.dart';
import 'package:sakkiny/features/home/presentation/manger/property_cubit/property_states.dart';
import 'package:sakkiny/features/home/presentation/views/widget/loading_indicator/list_view_home_loading_indicator.dart';
import 'package:sakkiny/features/home/presentation/views/widget/view_all_list_view.dart';

class ViewAllBlocBuilder extends StatelessWidget {
  const ViewAllBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyCubit, PropertyStates>(
      builder: (context, state) {
        if (state is SuccessPropertyState) {
          if (state.properties.isEmpty) {
            return CustomErrorWidget(
              errorMassage: "No properties have been added yet..".tr(context),
            );
          } else {
            return ViewAllListView(properties: state.properties);
          }
        } else if (state is FailurePropertyState) {
          return CustomErrorWidget(errorMassage: state.error);
        } else {
          return const ListViewHomeLoadingIndicator();
        }
      },
    );
  }
}
