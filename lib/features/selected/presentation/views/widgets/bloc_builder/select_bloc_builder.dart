import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/widgets/custom_error_widget.dart';
import 'package:sakkiny/features/selected/presentation/manger/select_cubit.dart';
import 'package:sakkiny/features/selected/presentation/manger/select_states.dart';
import 'package:sakkiny/features/selected/presentation/views/widgets/loading_indicator/select_view_loading_indicator.dart';
import 'package:sakkiny/features/selected/presentation/views/widgets/selected_view_body.dart';

class SelectBlocBuilder extends StatelessWidget {
  const SelectBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectCubit, SelectStates>(builder: (context, state) {
      if (state is SuccessSelectPropertyStates) {
        return SelectedViewBody(property: state.property);
      } else if (state is FailureSelectPropertyStates) {
        return CustomErrorWidget(errorMassage: state.error);
      } else {
        return const SelectViewLoadingIndicator();
      }
    });
  }
}
