import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/widgets/custom_error_widget.dart';
import 'package:sakkiny/core/widgets/custom_loading_liner_indicator.dart';
import 'package:sakkiny/features/home/presentation/manger/user_cubit/user_cubit.dart';
import 'package:sakkiny/features/home/presentation/manger/user_cubit/user_states.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/user_section.dart';

class UserProfileBlocBuilder extends StatelessWidget {
  const UserProfileBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserStates>(
      builder: (context, state) {
        if (state is SuccessUserState) {
          return UserSection(userModel: state.userModel);
        } else if (state is FailureUserState) {
          return CustomErrorWidget(errorMassage: state.error);
        } else {
          return const CustomLoadingLinerIndicator();
        }
      },
    );
  }
}
