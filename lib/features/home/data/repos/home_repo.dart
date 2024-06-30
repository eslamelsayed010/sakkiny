import 'package:dartz/dartz.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/home/data/models/user_model/user_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<Property>>> fetchProperty();
  Future<Either<Failures, List<Property>>> fetchRecommendedProperty();
  Future<Either<Failures, UserModel>> fetchUserInfo();
}
