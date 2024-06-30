import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/core/utils/end_points.dart';
import 'package:sakkiny/features/favorite/data/repo/favorite_repo.dart';
import 'package:sakkiny/features/home/data/models/home_model/home_model.dart';

class FavoriteRepoImpl extends FavoriteRepo {
  @override
  Future<Either<Failures, HomeModel>> changeFavoriteItem(
      {required String id}) async {
    try {
      var data = await DioHelper.putData(
        url: '/property/$id/like',
        token: token,
        data: {'id': id},
      );
      return right(HomeModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, HomeModel>> fetchFavoriteItem() async {
    try {
      var data = await DioHelper.getData(
        url: getFavProperty,
        token: token,
      );
      return right(HomeModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
