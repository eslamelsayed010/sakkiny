import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/core/utils/end_points.dart';

import 'package:sakkiny/features/selected_services/data/repo/select_services_repo.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

class SelectServiceRepoImpl extends SelectServiceRepo {
  @override
  Future<Either<Failures, Service>> fetchSelectService(
      {required String idService}) async {
    try {
      var data = await DioHelper.getData(
        url: '$getService/$idService',
        token:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVzbGltZWxzZXlkQGdtYWlsLmNvbSIsImlkIjoiNjY0NTBlMDhjNjNiMmIxNmU0OTJmMmIxIiwicm9sZSI6IlVzZXIiLCJpc2xvZ2dlZCI6dHJ1ZSwiaWF0IjoxNzE4MDM3NTM2fQ.LI_J7OJ_JAfP0DT1Y5F-s4kjUvKmMF_OHx-iIXRESEo',
      );

      return right(Service.fromJson(data.data['service']));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
  // @override
  // Future<Either<Failures, Property>> fetchSelectProperty(
  //     {required String idProperty}) async {
  //   try {
  //     var data = await DioHelper.getData(
  //       url: '$getProperty/$idProperty',
  //       token:
  //           'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVzbGltZWxzZXlkQGdtYWlsLmNvbSIsImlkIjoiNjY0NTBlMDhjNjNiMmIxNmU0OTJmMmIxIiwicm9sZSI6IlVzZXIiLCJpc2xvZ2dlZCI6dHJ1ZSwiaWF0IjoxNzE4MDM3NTM2fQ.LI_J7OJ_JAfP0DT1Y5F-s4kjUvKmMF_OHx-iIXRESEo',
  //     );

  //     return right(Property.fromJson(data.data['property']));
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.formDioError(e));
  //     } else {
  //       return left(ServerFailure(e.toString()));
  //     }
  //   }
  // }
}
