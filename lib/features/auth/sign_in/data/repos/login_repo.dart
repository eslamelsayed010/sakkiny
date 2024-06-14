import 'package:dartz/dartz.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/features/auth/sign_in/data/models/user_model/user_model.dart';

abstract class LoginRepo {
  Future<Either<Failures, UserModel>> fetchLogin(
      {required String email, required String password});
}
