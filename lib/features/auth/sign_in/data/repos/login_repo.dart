import 'package:dartz/dartz.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/features/auth/sign_in/data/models/auth_model/auth_model.dart';

abstract class LoginRepo {
  Future<Either<Failures, AuthModel>> fetchLogin(
      {required String email, required String password});
}
