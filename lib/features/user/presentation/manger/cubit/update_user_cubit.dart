// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/user/data/repo/user_repo_impl.dart';
import 'package:sakkiny/features/user/presentation/manger/cubit/update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserStates> {
  UpdateUserCubit() : super(UpdateUserStatesInitial());
  static UpdateUserCubit get(context) => BlocProvider.of(context);

  Future<void> fetchUserInfo({
    required MultipartFile profileImage,
  }) async {
    emit(UpdateUserStatesLoading());
    var result = await UserRepoImpl().fetchUserInfo(profileImage: profileImage);
    result.fold((error) {
      emit(UpdateUserStatesFailure(error.toString()));
      print(error.toString());
    }, (user) {
      emit(UpdateUserStatesSuccess(user));
    });
  }
}
