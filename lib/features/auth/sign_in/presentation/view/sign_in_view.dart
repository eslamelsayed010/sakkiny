import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/assets.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/auth/sign_in/presentation/manger/sign_in_cubit.dart';
import 'package:sakkiny/features/auth/sign_in/presentation/view/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 10),
              Image.asset(
                AssetsData.logoImage,
                width: 30,
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: kLogoColor,
                ),
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              )
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: const SignInViewBody(),
      ),
    );
  }
}
