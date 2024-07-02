import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/show_toast.dart';
import 'package:sakkiny/features/favorite/presentation/manager/change_fav_service_cubit/change_favorite_service_cubit.dart';
import 'package:sakkiny/features/favorite/presentation/manager/change_fav_service_cubit/change_favorite_service_state.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';
import 'package:sakkiny/features/services/presentation/manger/cubit/service_cubit.dart';

class CustomServices extends StatelessWidget {
  const CustomServices({Key? key, required this.service}) : super(key: key);
  final Service service;

  @override
  Widget build(BuildContext context) {
    ServiceCubit cubit = ServiceCubit.get(context);
    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kSelectedServicesView, extra: service);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black26),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
                imageUrl: service.images![0].secureUrl!,
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.error),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 10, bottom: 10, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.serviceCategory!.tr(context),
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${'Beginning from'.tr(context)} ${service.price} ${'LE'.tr(context)}',
                            style: const TextStyle(
                              fontSize: 10,
                              color: kLogoColor,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 5),
                        BlocConsumer<ChangeFavoriteServiceCubit,
                            ChangeFavoriteServiceState>(
                          listener: (context, state) {
                            if (state is SuccessChangeFavoriteServiceState) {
                              if (!state.changeFavoriteServiceModel.status!) {
                                showToast(
                                  txt: state
                                      .changeFavoriteServiceModel.message!,
                                  state: ToastState.ERROR,
                                );
                              }
                              showToast(
                                txt:
                                    state.changeFavoriteServiceModel.message!,
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
                            return Material(
                              color: Colors.transparent,
                              elevation: 5,
                              shape: const CircleBorder(),
                              child: Container(
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[300],
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: cubit.favorites[service.id]!
                                      ? const Icon(
                                          Icons.favorite_outlined,
                                          color: kLogoColor,
                                        )
                                      : const Icon(
                                          Icons.favorite_border_outlined),
                                  onPressed: () {
                                    ChangeFavoriteServiceCubit.get(context)
                                        .changeFavoriteServiceItem(
                                      id: service.id!,
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
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: kLocationColor,
                          size: 15,
                        ),
                        Text(
                          service.address ?? 'No address',
                          style: const TextStyle(
                            fontSize: 10,
                            color: kLocationColor,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
