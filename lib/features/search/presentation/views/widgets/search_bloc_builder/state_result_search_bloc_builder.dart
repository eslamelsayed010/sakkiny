import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/widgets/custom_error_widget.dart';
import 'package:sakkiny/features/filter/presentation/views/widgets/custom_no_result_search.dart';
import 'package:sakkiny/features/search/presentation/mange/search_cubit.dart';
import 'package:sakkiny/features/search/presentation/mange/search_state.dart';
import 'package:sakkiny/features/search/presentation/views/widgets/list_view_search_result.dart';
import 'package:sakkiny/features/search/presentation/views/widgets/loading_indicator_list_view_search.dart';
import 'package:sakkiny/features/search/presentation/views/widgets/no_result_search.dart';

class StateResultSearchBlocBuilder extends StatelessWidget {
  const StateResultSearchBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(builder: (context, state) {
      if (state is InitialSearchState) {
        return const NoResultSearch();
      } else if (state is SuccessSearchState) {
        if (state.result.isEmpty) {
          return const CustomNoResult();
        } else {
          return ListViewSearch(properties: state.result);
        }
      } else if (state is FailureSearchState) {
        return Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .3),
            CustomErrorWidget(errorMassage: state.error),
          ],
        );
      } else {
        return const LoadingIndicatorListViewSearch();
      }
    });
  }
}
