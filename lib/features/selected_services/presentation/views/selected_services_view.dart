import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/show_toast.dart';
import 'package:sakkiny/features/favorite/presentation/manager/change_fav_service_cubit/change_favorite_service_cubit.dart';
import 'package:sakkiny/features/favorite/presentation/manager/change_fav_service_cubit/change_favorite_service_state.dart';
import 'package:sakkiny/features/selected_services/presentation/manger/cubit/select_service_cubit.dart';
import 'package:sakkiny/features/selected_services/presentation/views/widgets/bloc_builder/bloc_builder_select_view_body.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

import '../../../services/presentation/manger/cubit/service_cubit.dart';

class SelectedServicesView extends StatelessWidget {
  const SelectedServicesView({Key? key, required this.service})
      : super(key: key);
  final Service service;
  @override
  Widget build(BuildContext context) {
    ServiceCubit cubit = ServiceCubit.get(context);
    return BlocProvider(
      create: (context) =>
          SelectServiceCubit()..fetchSelectService(idService: service.id!),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              // const SelectedServicesViewBody(),
              const SelectServiceBlocBuilder(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    FloatingActionButton(
                        heroTag: 'arrow_back_home',
                        backgroundColor: kFloatingColor,
                        mini: true,
                        child: const Icon(
                          Icons.arrow_back,
                          color: kLogoColor,
                        ),
                        onPressed: () {
                          GoRouter.of(context).pop();
                        }),
                    const Spacer(),
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
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: kFloatingColor,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
