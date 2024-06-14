import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/auth/sign_in/data/repos/login_repo_impl.dart';
import 'package:sakkiny/features/auth/sign_in/presentation/manger/sign_in_states.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(InitialSignInState());
  static SignInCubit get(context) => BlocProvider.of(context);

  void userLogin({required String email, required String password}) async {
    emit(LoadingSignInState());
    var value =
        await LoginRepoImpl().fetchLogin(email: email, password: password);
    value.fold((error) {
      emit(FailureSignInState(error.toString()));
    }, (userModel) {
      emit(SuccessSignInState(userModel));
    });
  }
}
