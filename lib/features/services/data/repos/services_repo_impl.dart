import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/core/utils/end_points.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';
import 'package:sakkiny/features/services/data/repos/services_repo.dart';

class ServiceRepoImpl extends ServiceRepo {
  @override
  Future<Either<Failures, List<Service>>> fetchService() async {
    try {
      var data = await DioHelper.getData(
        token:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVzbGltZWxzZXlkQGdtYWlsLmNvbSIsImlkIjoiNjY0NTBlMDhjNjNiMmIxNmU0OTJmMmIxIiwicm9sZSI6IlVzZXIiLCJpc2xvZ2dlZCI6dHJ1ZSwiaWF0IjoxNzE3NjE0MTE2LCJleHAiOjE3MTc3MDA1MTZ9.BY5tcmARV0oFWX738-jDNiBQ4zgtOw7moA1vkgtwlWE',
        url: getService,
      );

      List<Service> services = [];
      for (var homeMap in data.data['services']) {
        services.add(Service.fromJson(homeMap));
      }
      return right(services);
    } catch (e) {
      if (e is DioException) {
        //  print(e.error.toString());
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  // @override
  // Future<Either<Failures, List<Service>>> fetchRecommendedService()async {
  //    try {
  //     var data = await DioHelper.getData(
  //       token:
  //           'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVzbGltZWxzZXlkQGdtYWlsLmNvbSIsImlkIjoiNjY0NTBlMDhjNjNiMmIxNmU0OTJmMmIxIiwicm9sZSI6IlVzZXIiLCJpc2xvZ2dlZCI6dHJ1ZSwiaWF0IjoxNzE3NjE0MTE2LCJleHAiOjE3MTc3MDA1MTZ9.BY5tcmARV0oFWX738-jDNiBQ4zgtOw7moA1vkgtwlWE',
  //       url: getService,

  //     );

  //      List<Service> services = [];
  //     for (var homeMap in data.data['services']) {
  //       services.add(Service.fromJson(homeMap));
  //     }
  //     return right(services);
  //   } catch (e) {
  //     if (e is DioException) {
  //       //  print(e.error.toString());
  //       return left(ServerFailure.formDioError(e));
  //     } else {
  //       return left(ServerFailure(e.toString()));
  //     }
  //   }
}
