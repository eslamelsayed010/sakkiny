import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/core/utils/end_points.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/selected/data/repo/select_repo.dart';

class SelectRepoImpl extends SelectRepo {
  @override
  Future<Either<Failures, Property>> fetchSelectProperty(
      {required String idProperty}) async {
    try {
      var data = await DioHelper.getData(
        url: '$getProperty/$idProperty',
        token: token,
      );

      return right(Property.fromJson(data.data['property']));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
