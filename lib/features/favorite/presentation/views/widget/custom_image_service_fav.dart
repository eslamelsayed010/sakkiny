import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/show_toast.dart';
import 'package:sakkiny/features/favorite/presentation/manager/change_fav_service_cubit/change_favorite_service_cubit.dart';
import 'package:sakkiny/features/favorite/presentation/manager/change_fav_service_cubit/change_favorite_service_state.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';
import 'package:sakkiny/features/services/presentation/manger/cubit/service_cubit.dart';

class CustomImageFavService extends StatelessWidget {
  const CustomImageFavService({super.key, required this.service});

  final Service service;
  @override
  Widget build(BuildContext context) {
    ServiceCubit cubit = ServiceCubit.get(context);
    var favorite = cubit.favorites[service.id];
    return Stack(
      alignment: Alignment.topRight,
      children: [
        CachedNetworkImage(
          height: 150,
          width: double.infinity,
          fit: BoxFit.cover,
          imageUrl: service.images![0].secureUrl!,
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error),
          ),
        ),
        BlocConsumer<ChangeFavoriteServiceCubit,
            ChangeFavoriteServiceState>(
          listener: (context, state) {
            if (state is SuccessChangeFavoriteServiceState) {
              if (!state.changeFavoriteServiceModel.status!) {
                showToast(
                  txt: state.changeFavoriteServiceModel.message!,
                  state: ToastState.ERROR,
                );
              }
              showToast(
                txt: state.changeFavoriteServiceModel.message!,
                state: ToastState.SUCCESS,
              );
            }
            if (state is FailureChangeFavoriteServiceState) {
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
                  icon: favorite!
                      ? const Icon(
                          Icons.favorite_outlined,
                          color: kLogoColor,
                        )
                      : const Icon(Icons.favorite_border_outlined),
                  onPressed: () {
                    ChangeFavoriteServiceCubit.get(context)
                        .changeFavoriteServiceItem(
                      id: service.id!,
                      context: context,
                    );
                  },
                ));
          },
        ),
      ],
    );
  }
}
