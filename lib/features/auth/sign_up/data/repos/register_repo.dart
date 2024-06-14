import 'package:dartz/dartz.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/features/auth/sign_in/data/models/user_model/user_model.dart';

abstract class RegisterRepo {
  Future<Either<Failures, UserModel>> fetchRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String gender,
    required String age,
  });
}
