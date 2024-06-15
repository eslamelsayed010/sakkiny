import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/core/utils/end_points.dart';
import 'package:sakkiny/features/filter/data/repos/filter_repo.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';

class FilterRepoImpl extends FilterRepo {
  @override
  Future<Either<Failures, List<Property>>> fetchFilter({
    required int priceGte,
    required int priceLte,
    required int areaGte,
    required int areaLte,
    required String type,
    required String per,
  }) async {
    try {
      var data = await DioHelper.getData(
        url: search,
        query: {
          'price[gte]': priceGte,
          'price[lte]': priceLte,
          'area[gte]': areaGte,
          'area[lte]': areaLte,
          'type': type,
          'per': per,
        },
      );
      List<Property> result = [];
      for (var item in data.data['properties']) {
        result.add(Property.fromJson(item));
      }
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
