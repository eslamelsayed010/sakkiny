import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/features/verify/data/model/send_code_model.dart';
import 'package:sakkiny/features/verify/data/model/verify_identity.dart';
import 'package:sakkiny/features/verify/data/repo/verify_repo.dart';
import '../../../../../core/utils/end_points.dart';

class VerifyRepoImpl extends VerifyRepo {
  @override
  Future<Either<Failures, SendCodeModel>> fetchCode() async {
    try {
      var data = await DioHelper.postData(
        url: sendCode,
        token: token,
      );
      return right(SendCodeModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, VerifyIdentityModel>> postVerifyIdentity({
    required String code,
    required MultipartFile cameraImage,
    required MultipartFile frontIDImage,
    required MultipartFile backIDImage,
  }) async {
    try {
      var data = await DioHelper.postDataWithImage(
        url: verifyIdentity,
        token: token,
        data: {
          'code': code,
          'cameraImage': cameraImage,
          'frontIDImage': frontIDImage,
          'backIDImage': backIDImage,
        },
      );
      return right(VerifyIdentityModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
