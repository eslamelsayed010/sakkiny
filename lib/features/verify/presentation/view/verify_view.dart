import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/features/verify/presentation/manger/send_cubit/send_cubit.dart';
import 'package:sakkiny/features/verify/presentation/manger/verify_cubit/verify_cubit.dart';
import 'package:sakkiny/features/verify/presentation/view/widgets/verify_view_body.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SendCubit()),
        BlocProvider(create: (context) => VerifyCubit()),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          title: Text('Verify your identity'.tr(context)),
          centerTitle: true,
        ),
        body: const VerifyViewBody(),
      ),
    );
  }
}
