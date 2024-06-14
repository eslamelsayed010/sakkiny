import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/selected/presentation/manger/select_cubit.dart';
import 'package:sakkiny/features/selected/presentation/views/widgets/bloc_builder/select_bloc_builder.dart';

class SelectedView extends StatelessWidget {
  const SelectedView({Key? key, required this.property}) : super(key: key);
  final Property property;
  @override
  Widget build(BuildContext context) {
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
