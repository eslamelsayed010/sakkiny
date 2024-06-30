import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/core/utils/end_points.dart';
import 'package:sakkiny/features/user/data/models/update_user_model/update_user_model.dart';
import 'package:sakkiny/features/user/data/repo/user_repo.dart';

class UserRepoImpl extends UserRepo {
  @override
  Future<Either<Failures, UpdateUserModel>> fetchUserInfo(
      {required MultipartFile profileImage}) async {
    try {
      var data = await DioHelper.postDataWithImage(
        url: userImage,
        token: token,
        data: {'ProfilePicture': profileImage},
      );
      return right(UpdateUserModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
