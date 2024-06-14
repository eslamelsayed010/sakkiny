import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/add/presentation/manger/add_property_cubit.dart';
import 'package:sakkiny/features/add/presentation/views/widget/add_property_view_body.dart';

class AddPropertyView extends StatelessWidget {
  const AddPropertyView({Key? key}) : super(key: key);

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
        create: (context) => AddPropertyCubit(),
        child: const AddPropertyViewBody(),
      ),
    );
  }
}
