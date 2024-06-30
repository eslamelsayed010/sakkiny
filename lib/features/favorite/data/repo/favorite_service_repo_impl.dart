import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/core/utils/end_points.dart';
import 'package:sakkiny/features/favorite/data/repo/favorite_service_repo.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/get_service_model.dart';

class FavoriteServiceRepoImpl extends FavoriteServiceRepo {
  @override
  Future<Either<Failures, GetServiceModel>> changeFavoriteServiceItem(
      {required String id}) async {
    try {
      var data = await DioHelper.putData(
        url: '/service/$id/like',
        token: token,
        data: {
          'id': id,
        },
      );
      return right(GetServiceModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, GetServiceModel>> fetchFavoriteServiceItem() async {
    try {
      var data = await DioHelper.getData(
        url: getFavService,
        token: token,
      );
      return right(GetServiceModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
