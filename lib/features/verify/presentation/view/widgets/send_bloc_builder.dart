import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_loading_liner_indicator.dart';
import 'package:sakkiny/core/widgets/show_toast.dart';
import 'package:sakkiny/features/verify/presentation/manger/send_cubit/send_cubit.dart';
import 'package:sakkiny/features/verify/presentation/manger/send_cubit/send_states.dart';

class SendCodeBlocBuilder extends StatelessWidget {
  const SendCodeBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .2),
      child: BlocBuilder<SendCubit, SendStates>(
        builder: (context, state) {
          SendCubit sendCubit = SendCubit.get(context);
          if (state is InitialSendState) {
            return TextButton(
                onPressed: () {
                  sendCubit.sendCode();
                },
                child: Text(
                  'Send your code !Click here'.tr(context),
                  style: const TextStyle(
                    color: kLogoColor,
                  ),
                  // maxLines: 1,
                  // overflow: TextOverflow.ellipsis,
                ));
          } else if (state is SuccessSendState) {
            return TextButton(
              onPressed: () {
                showToast(
                    txt: '${state.sendCodeModel.message!} .',
                    state: ToastState.SUCCESS);
              },
              child: Text(
                '${state.sendCodeModel.message!} .',
                style: const TextStyle(color: Colors.green),
              ),
            );
          } else if (state is FailureSendState) {
            return TextButton(
              onPressed: () {
                showToast(txt: '${state.error} .', state: ToastState.SUCCESS);
              },
              child: Text(
                '${state.error} .',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const CustomLoadingLinerIndicator();
          }
        },
      ),
    );
  }
}
