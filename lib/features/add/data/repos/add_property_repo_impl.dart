import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/core/utils/end_points.dart';
import 'package:sakkiny/features/add/data/models/add_property_model/add_property_model.dart';
import 'package:sakkiny/features/add/data/repos/add_property_repo.dart';

class AddRepoImpl implements AddRepo {
  @override
  Future<Either<Failures, AddPropertyModel>> addProperty({
    required bool isFurnished,
    required int price,
    required int bedrooms,
    required String level,
    required int? bathrooms,
    required int area,
    required String details,
    required String address,
    required num lat,
    required num long,
    required List<MultipartFile> propertyImages,
    required String type,
    required String per,
    required String description,
    required String addedByType,
  }) async {
    try {
      var data = await DioHelper.postDataWithImage(
        url: addPropertyy,
        token: token,
        data: {
          "description": description,
          "type": type,
          "bedrooms": bedrooms,
          "bathrooms": bathrooms,
          "area": area,
          "level": level,
          "isFurnished": isFurnished,
          "details": details,
          "price": price,
          "per": per,
          "address": address,
          "propertyImages": propertyImages,
          "longitude": long,
          'latitude': lat,
          'addedByType': addedByType,
        },
      );
      return right(AddPropertyModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
