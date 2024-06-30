import 'package:dartz/dartz.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/get_service_model.dart';

abstract class FavoriteServiceRepo {
  Future<Either<Failures, GetServiceModel>> changeFavoriteServiceItem(
      {required String id});
  Future<Either<Failures, GetServiceModel>> fetchFavoriteServiceItem();
}