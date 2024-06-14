import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/assets.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/auth/sign_up/presentation/manger/register_cubit.dart';
import 'package:sakkiny/features/auth/sign_up/presentation/view/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: kLogoColor,
                ),
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
              const Spacer(),
              Image.asset(
                AssetsData.logoImage,
                width: 30,
              ),
              const SizedBox(width: 10),
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: const SignUpViewBody(),
      ),
    );
  }
}
