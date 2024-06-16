import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/add_service/presentation/manager/cubit/add_service_cubit.dart';
import 'package:sakkiny/features/add_service/presentation/views/widgets/add_service_view_body.dart';

class AddServicesView extends StatelessWidget {
  const AddServicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            FloatingActionButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              backgroundColor: Colors.grey[300],
              mini: true,
              child: const Icon(
                Icons.arrow_back,
                color: kLogoColor,
              ),
            )
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => AddServiceCubit(),
        child: const AddServicesViewBody(),
      ),
    );
  }
}
