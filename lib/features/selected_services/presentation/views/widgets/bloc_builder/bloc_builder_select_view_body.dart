import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/widgets/custom_error_widget.dart';
import 'package:sakkiny/features/selected_services/presentation/manger/cubit/select_service_cubit.dart';
import 'package:sakkiny/features/selected_services/presentation/manger/cubit/select_service_state.dart';
import 'package:sakkiny/features/selected_services/presentation/views/widgets/loading_indicator/select_service_view_loading_indicator.dart';
import 'package:sakkiny/features/selected_services/presentation/views/widgets/selected_services_view_body.dart';

class SelectServiceBlocBuilder extends StatelessWidget {
  const SelectServiceBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectServiceCubit, SelectServiceStates>(
        builder: (context, state) {
      if (state is SuccessSelectServiceStates) {
        return SelectedServicesViewBody(
          service: state.service,
        );
      } else if (state is FailureSelectServiceStates) {
        return CustomErrorWidget(errorMassage: state.error);
      } else {
        return const SelectServiceViewLoadingIndicator();
      }
    });
  }
}
