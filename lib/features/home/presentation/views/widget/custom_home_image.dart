import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/show_toast.dart';
import 'package:sakkiny/features/favorite/presentation/manager/change_fav_cubit/change_favorite_cubit.dart';
import 'package:sakkiny/features/favorite/presentation/manager/change_fav_cubit/change_favorite_state.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/home/presentation/manger/property_cubit/property_cubit.dart';

class CustomHomeImage extends StatelessWidget {
  const CustomHomeImage({super.key, required this.property});
  final Property property;

  @override
  Widget build(BuildContext context) {
    PropertyCubit cubit = PropertyCubit.get(context);
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            width: MediaQuery.of(context).size.width * .8,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: property.propertyImages![0].secureUrl!,
              errorWidget: (context, url, error) => const Center(
                child: Icon(Icons.error),
              ),
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
                        state: ToastState.SUCCESS,
                      );
                    } else {
                      showToast(
                          txt: state.changeFavoriteModel.message!,
                          state: ToastState.ERROR);
                    }
                  }
                },
                builder: (context, state) {
                  bool isFavorite = cubit.favorites[property.id] ?? false;

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
                        icon: isFavorite
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
