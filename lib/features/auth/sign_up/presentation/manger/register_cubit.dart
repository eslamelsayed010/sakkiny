import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/auth/sign_up/data/repos/register_repo_impl.dart';
import 'package:sakkiny/features/auth/sign_up/presentation/manger/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitialRegisterStates());
  static RegisterCubit get(context) => BlocProvider.of(context);

  Future<void> userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String gender,
    required String age,
  }) async {
    emit(LoadingRegisterStates());
    var value = await RegisterRepoImpl().fetchRegister(
      email: email,
      password: password,
      name: name,
      phone: phone,
      gender: gender,
      age: age,
    );
    value.fold((error) {
      emit(FailureRegisterStates(error.toString()));
    }, (authModel) {
      emit(SuccessRegisterStates(authModel));
    });
  }
}
