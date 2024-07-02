import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/show_toast.dart';
import 'package:sakkiny/features/favorite/presentation/manager/change_fav_cubit/change_favorite_cubit.dart';
import 'package:sakkiny/features/favorite/presentation/manager/change_fav_cubit/change_favorite_state.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/home/presentation/manger/property_cubit/property_cubit.dart';

class CustomImageSearch extends StatelessWidget {
  const CustomImageSearch({super.key, required this.property});
  final Property property;
  @override
  Widget build(BuildContext context) {
    PropertyCubit cubit = PropertyCubit.get(context);
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            height: 250,
            width: double.infinity,
            imageUrl: property.propertyImages![0].secureUrl!,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.error),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              const Spacer(),
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
                  return Material(
                    color: Colors.transparent,
                    elevation: 5,
                    shape: const CircleBorder(),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: cubit.favorites[property.id]!
                            ? const Icon(
                                Icons.favorite_outlined,
                                color: kLogoColor,
                              )
                            : const Icon(Icons.favorite_border_outlined),
                        onPressed: () {
                          ChangeFavoriteCubit.get(context).changeFavoriteItem(
                            id: property.id!,
                            context: context,
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
