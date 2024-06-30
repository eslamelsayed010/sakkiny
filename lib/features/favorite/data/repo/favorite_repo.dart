import 'package:dartz/dartz.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/features/home/data/models/home_model/home_model.dart';

abstract class FavoriteRepo {
  Future<Either<Failures, HomeModel>> changeFavoriteItem(
      {required String id});
  Future<Either<Failures, HomeModel>> fetchFavoriteItem();
}