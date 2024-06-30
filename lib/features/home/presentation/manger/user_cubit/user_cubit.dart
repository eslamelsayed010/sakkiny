import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/home/data/models/user_model/user_model.dart';
import 'package:sakkiny/features/home/data/repos/home_repo_impl.dart';
import 'package:sakkiny/features/home/presentation/manger/user_cubit/user_states.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(InitialUserState());
  static UserCubit get(context) => BlocProvider.of(context);

  UserModel? userModel1;

  Future<void> fetchUserInfo() async {
    emit(LoadingUserState());
    var result = await HomeRepoImpl().fetchUserInfo();
    result.fold((failure) {
      emit(FailureUserState(failure.error));
    }, (userModel) {
      emit(SuccessUserState(userModel));
      userModel1 = userModel;
    });
  }
}
