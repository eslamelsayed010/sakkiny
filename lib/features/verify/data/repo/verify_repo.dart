import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/features/verify/data/model/send_code_model.dart';
import 'package:sakkiny/features/verify/data/model/verify_identity.dart';

abstract class VerifyRepo {
  Future<Either<Failures, SendCodeModel>> fetchCode();
  Future<Either<Failures, VerifyIdentityModel>> postVerifyIdentity(
  {
    required String code,
    required MultipartFile cameraImage,
    required MultipartFile frontIDImage,
    required MultipartFile backIDImage,
}
      );
}
