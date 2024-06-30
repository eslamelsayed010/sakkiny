import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/features/auth/sign_in/data/models/auth_model/auth_model.dart';
import 'package:sakkiny/features/auth/sign_in/data/repos/login_repo.dart';
import '../../../../../core/utils/end_points.dart';

class LoginRepoImpl extends LoginRepo {
  @override
  Future<Either<Failures, AuthModel>> fetchLogin(
      {required String email, required String password}) async {
    try {
      var data = await DioHelper.postData(
        url: login,
        data: {
          'email': email,
          'password': password,
        },
      );
      return right(AuthModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
