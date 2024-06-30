import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/verify/data/repo/verify_repo_impl.dart';
import 'package:sakkiny/features/verify/presentation/manger/send_cubit/send_states.dart';

class SendCubit extends Cubit<SendStates> {
  SendCubit() : super(InitialSendState());
  static SendCubit get(context) => BlocProvider.of(context);

  void sendCode() async {
    emit(LoadingSendState());
    var value = await VerifyRepoImpl().fetchCode();
    value.fold((error) {
      emit(FailureSendState(error.toString()));
    }, (sendCodeModel) {
      emit(SuccessSendState(sendCodeModel));
    });
  }
}
