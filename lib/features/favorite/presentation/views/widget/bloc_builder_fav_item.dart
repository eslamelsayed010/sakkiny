import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_error_widget.dart';
import 'package:sakkiny/core/widgets/custom_loading_indicator.dart';
import 'package:sakkiny/features/favorite/presentation/manager/fav_cubit/fav_cubit.dart';
import 'package:sakkiny/features/favorite/presentation/manager/fav_cubit/fav_state.dart';
import 'package:sakkiny/features/favorite/presentation/views/widget/grid_view_home_fav.dart';

class BlocBuilderFavItem extends StatelessWidget {
  const BlocBuilderFavItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavStates>(builder: (context, state) {
      if (state is SuccessFetchFavoriteState) {
        if (state.favModel.properties == null) {
          return CustomErrorWidget(
            errorMassage:
                "your favorite list is empty".tr(context),
            color: kLogoColor,
          );
        }
        return GridViewHomeFav(favPropertyModel: state.favModel);
      } else if (state is FailureFetchFavoriteState) {
        return CustomErrorWidget(errorMassage: state.error);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
