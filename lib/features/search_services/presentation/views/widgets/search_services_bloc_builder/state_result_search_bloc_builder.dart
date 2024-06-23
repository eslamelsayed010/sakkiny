import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/widgets/custom_error_widget.dart';
import 'package:sakkiny/features/filter/presentation/views/widgets/custom_no_result_search.dart';
import 'package:sakkiny/features/search_services/presentation/manager/cubit/search_service_cubit.dart';
import 'package:sakkiny/features/search_services/presentation/manager/cubit/search_service_state.dart';
import 'package:sakkiny/features/search_services/presentation/views/widgets/list_view_search_services_result.dart';
import 'package:sakkiny/features/search_services/presentation/views/widgets/loading_indicator/list_view_search_result_loading_indicator.dart';
import 'package:sakkiny/features/search_services/presentation/views/widgets/no_result_search.dart';

class StateResultSearchServiceBlocBuilder extends StatelessWidget {
  const StateResultSearchServiceBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchserviceCubit, SearchServiceStates>(
        builder: (context, state) {
      if (state is InitialSearchServiceState) {
        return const NoResultSearchServices();
      } else if (state is SuccessSearchServiceState) {
        if (state.result.isEmpty) {
          return const CustomNoResult();
        } else {
          return ListViewSearchServices(services: state.result);
        }
      } else if (state is FailureSearchServiceState) {
        return Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .3),
            CustomErrorWidget(errorMassage: state.error),
          ],
        );
      } else {
        return const ListViewSearchServicesLoadingIndicator();
      }
    });
  }
}
