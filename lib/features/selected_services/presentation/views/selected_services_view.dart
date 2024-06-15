import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/selected_services/presentation/manger/cubit/select_service_cubit.dart';
import 'package:sakkiny/features/selected_services/presentation/views/widgets/bloc_builder/bloc_builder_select_view_body.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

class SelectedServicesView extends StatelessWidget {
  const SelectedServicesView({Key? key, required this.service})
      : super(key: key);
  final Service service;
  @override
  Widget build(BuildContext context) {
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
                    FloatingActionButton(
                        heroTag: 'favorite_outlined',
                        backgroundColor: kFloatingColor,
                        mini: true,
                        child: const Icon(
                          Icons.favorite_outlined,
                          color: kLogoColor,
                        ),
                        onPressed: () {}),
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
