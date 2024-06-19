// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:lomaTV/core/errors/failures.dart';
// import 'package:lomaTV/core/utils/api_services.dart';
// import 'package:lomaTV/features/home/data/models/movie_model.dart';
// import 'package:lomaTV/features/search/data/repos/search_services_repo.dart';
//
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/core/utils/end_points.dart';
import 'package:sakkiny/features/search_services/data/repos/search_services_repo.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

class SearchServiceRepoImpl extends SearchServiceRepo {
  @override
  Future<Either<Failures, List<Service>>> fetchSearchService(
      {required String param}) async {
    try {
      var data = await DioHelper.getData(
        url: searchService,
        query: {
          'search': param,
        },
      );
      List<Service> result = [];
      for (var item in data.data['services']) {
        result.add(Service.fromJson(item));
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
