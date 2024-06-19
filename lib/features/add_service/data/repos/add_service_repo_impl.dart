import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/core/utils/end_points.dart';
import 'package:sakkiny/features/add_service/data/model/service_model/service_model.dart';
import 'package:sakkiny/features/add_service/data/repos/add_service_repo.dart';

class AddServiceRepoImpl implements AddService {
  @override
  Future<Either<Failures, ServiceModel>> addService(
      {required int price,
      required String serviceCategory,
      required String address,
      required num lat,
      required num long,
      required List<MultipartFile> propertyImages,
      required String description}) async {
    try {
      var data = await DioHelper.postDataWithImage(
        url: addServicee,
        token:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVzbGltZWxzZXlkQGdtYWlsLmNvbSIsImlkIjoiNjY0NTBlMDhjNjNiMmIxNmU0OTJmMmIxIiwicm9sZSI6IlVzZXIiLCJpc2xvZ2dlZCI6dHJ1ZSwiaWF0IjoxNzE4NDYxOTAxfQ.Vnm5faW3NgtWoBs3Q_2zjEoJo6sM4eHlc2LY4pnjwIU',
        data: {
          "description": description,
          "serviceCategory": serviceCategory,
          "price": price,
          "address": address,
          "images": propertyImages,
          "location[longitude]": long,
          'location[latitude]': lat,
        },
      );
      return right(ServiceModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
