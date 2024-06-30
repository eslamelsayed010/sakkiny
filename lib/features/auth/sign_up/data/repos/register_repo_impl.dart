import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/core/utils/end_points.dart';
import 'package:sakkiny/features/auth/sign_in/data/models/auth_model/auth_model.dart';
import 'package:sakkiny/features/auth/sign_up/data/repos/register_repo.dart';

class RegisterRepoImpl extends RegisterRepo {
  @override
  Future<Either<Failures, AuthModel>> fetchRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String age,
    required String gender,
  }) async {
    try {
      var data = await DioHelper.postData(
        url: register,
        data: {
          'email': email,
          'password': password,
          'phoneNumber': phone,
          'name': name,
          'age': age,
          'gender': gender,
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
