import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/widgets/custom_error_widget.dart';

import 'package:sakkiny/features/services/presentation/manger/cubit/service_cubit.dart';
import 'package:sakkiny/features/services/presentation/manger/cubit/service_state.dart';
import 'package:sakkiny/features/services/presentation/view/widget/grid_view_loading_indicator.dart';
import 'package:sakkiny/features/services/presentation/view/widget/grid_view_services.dart';

class ServiceBlocBuilder extends StatelessWidget {
  const ServiceBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceCubit, ServiceStates>(
      builder: (context, state) {
        if (state is SuccessServiceState) {
          if (state.service.isEmpty) {
            return CustomErrorWidget(
                errorMassage: 'No services have been added yet..'.tr(context));
          } else {
            return GridViewServices(services: state.service);
          }
        } else if (state is FailureServiceState) {
          return CustomErrorWidget(errorMassage: state.error);
        } else {
          return const GridViewLoadingIndicator();
        }
      },
    );
  }
}
