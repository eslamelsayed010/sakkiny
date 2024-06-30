import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/verify/data/repo/verify_repo_impl.dart';
import 'package:sakkiny/features/verify/presentation/manger/verify_cubit/verify_states.dart';

class VerifyCubit extends Cubit<VerifyStates> {
  VerifyCubit() : super(InitialVerifyState());
  static VerifyCubit get(context) => BlocProvider.of(context);

  void verifyIdentity({
    required String code,
    required MultipartFile cameraImage,
    required MultipartFile frontIDImage,
    required MultipartFile backIDImage,
  }) async {
    emit(LoadingVerifyState());
    var value = await VerifyRepoImpl().postVerifyIdentity(
      code: code,
      cameraImage: cameraImage,
      frontIDImage: frontIDImage,
      backIDImage: backIDImage,
    );
    value.fold((error) {
      emit(FailureVerifyState(error.toString()));
    }, (verifyIdentityModel) {
      emit(SuccessVerifyState(verifyIdentityModel));
    });
  }
}
