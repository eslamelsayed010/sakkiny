import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/show_toast.dart';
import 'package:sakkiny/features/favorite/presentation/manager/change_fav_cubit/change_favorite_cubit.dart';
import 'package:sakkiny/features/favorite/presentation/manager/change_fav_cubit/change_favorite_state.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/home/presentation/manger/property_cubit/property_cubit.dart';

class CustomImageFav extends StatelessWidget {
  const CustomImageFav({super.key, required this.property});
  final Property property;
  @override
  Widget build(BuildContext context) {
    PropertyCubit cubit = PropertyCubit.get(context);
    var favorite = cubit.favorites[property.id];
    return Stack(
      alignment: Alignment.topRight,
      children: [
        CachedNetworkImage(
          height: 150,
          width: double.infinity,
          fit: BoxFit.cover,
          imageUrl: property.propertyImages![0].secureUrl!,
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error),
          ),
        ),
        BlocConsumer<ChangeFavoriteCubit, ChangeFavoriteState>(
          listener: (context, state) {
            if (state is SuccessChangeFavoriteState) {
              if (!state.changeFavoriteModel.status!) {
                showToast(
                  txt: state.changeFavoriteModel.message!,
                  state: ToastState.ERROR,
                );
              }
              showToast(
                txt: state.changeFavoriteModel.message!,
                state: ToastState.SUCCESS,
              );
            }
            if (state is FailureChangeFavoriteState) {
              showToast(
                txt: state.error,
                state: ToastState.ERROR,
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: favorite != null && favorite
                    ? const Icon(
                        Icons.favorite_outlined,
                        color: kLogoColor,
                      )
                    : const Icon(Icons.favorite_border_outlined),
                onPressed: () {
                  if (favorite != null) {
                    ChangeFavoriteCubit.get(context).changeFavoriteItem(
                      id: property.id!,
                      context: context,
                    );
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
