import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/core/utils/end_points.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/search/data/repos/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  @override
  Future<Either<Failures, List<Property>>> fetchSearch(
      {required String param}) async {
    try {
      var data = await DioHelper.getData(
        url: search,
        query: {
          'search': param,
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
