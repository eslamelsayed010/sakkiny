import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/widgets/custom_error_widget.dart';
import 'package:sakkiny/core/widgets/custom_loading_indicator.dart';

import 'package:sakkiny/features/favorite/presentation/manager/fav_service_cubit/fav_service_cubit.dart';
import 'package:sakkiny/features/favorite/presentation/manager/fav_service_cubit/fav_service_state.dart';
import 'package:sakkiny/features/favorite/presentation/views/widget/grid_view_services_fav.dart';


class BlocBuilderFavServiceItem extends StatelessWidget {
  const BlocBuilderFavServiceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavServiceCubit, FavServiceStates>(builder: (context, state) {
      if (state is SuccessFetchFavoriteServiceState) {
        return  GridViewServicesFav(favServiceModel: state.favServiceModel,);
      } else if (state is FailureFetchFavoriteServiceState) {
        return CustomErrorWidget(errorMassage: state.error);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
