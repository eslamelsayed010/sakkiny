import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/search_services/presentation/manager/cubit/search_service_cubit.dart';
import 'package:sakkiny/features/search_services/presentation/views/widgets/search_services_view_body.dart';

class SearchServicesView extends StatelessWidget {
  const SearchServicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchserviceCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: kLogoColor,
            ),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const SearchServicesViewBody(),
      ),
    );
  }
}
