import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/show_toast.dart';
import 'package:sakkiny/features/favorite/presentation/manager/change_fav_cubit/change_favorite_cubit.dart';
import 'package:sakkiny/features/favorite/presentation/manager/change_fav_cubit/change_favorite_state.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/home/presentation/manger/property_cubit/property_cubit.dart';
import 'package:sakkiny/features/selected/presentation/manger/select_cubit.dart';
import 'package:sakkiny/features/selected/presentation/views/widgets/bloc_builder/select_bloc_builder.dart';

class SelectedView extends StatelessWidget {
  const SelectedView({Key? key, required this.property}) : super(key: key);
  final Property property;
  @override
  Widget build(BuildContext context) {
    PropertyCubit cubit = PropertyCubit.get(context);
    return BlocProvider(
      create: (context) =>
          SelectCubit()..fetchSelectProperty(idProperty: property.id!),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              const SelectBlocBuilder(),
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
                    BlocProvider(
                      create: (context) => ChangeFavoriteCubit(),
                      child: BlocConsumer<ChangeFavoriteCubit,
                          ChangeFavoriteState>(
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
                          if (state is FailureChangeFavoriteState){
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
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: kFloatingColor,
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: cubit.favorites[property.id]!
                                    ? const Icon(
                                        Icons.favorite_outlined,
                                        color: kLogoColor,
                                      )
                                    : const Icon(
                                        Icons.favorite_border_outlined),
                                onPressed: () {
                                  ChangeFavoriteCubit.get(context)
                                      .changeFavoriteItem(
                                    id: property.id!,
                                    context: context,
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
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
