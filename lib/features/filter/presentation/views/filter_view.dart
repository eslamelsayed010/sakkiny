// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/features/filter/presentation/mange/filter_cubit.dart';
import 'package:sakkiny/features/filter/presentation/mange/filter_state.dart';
import 'package:sakkiny/features/filter/presentation/views/widgets/error_filter_view.dart';
import 'package:sakkiny/features/filter/presentation/views/widgets/filter_view_body.dart';
import 'package:sakkiny/features/filter/presentation/views/widgets/list_view_filter_result.dart';
import 'package:sakkiny/features/filter/presentation/views/widgets/loading_indicator_list_vew_filter.dart';

class FilterView extends StatelessWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search Filter'.tr(context)),
          centerTitle: true,
        ),
        body: BlocConsumer<FilterCubit, FilterStates>(
          listener: (context, state) {
            if (state is SuccessFilterState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ListViewFilterResult(property: state.result),
                ),
              );
            }
            if (state is FailureFilterState) {
              print(state.error);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ErrorFilterView(error: state.error),
                ),
              );
            }
            if (state is LoadingFilterState) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoadingIndicatorListViewFilter(),
                ),
              );
            }
          },
          builder: (context, state) => const FilterViewBody(),
        ),
      ),
    );
  }
}
