import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/features/user/data/models/update_user_model/update_user_model.dart';

abstract class UserRepo {
  Future<Either<Failures, UpdateUserModel>> fetchUserInfo(
      {required MultipartFile profileImage});
}
