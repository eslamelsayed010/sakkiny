import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/const.dart';
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
        token: token,
        data: {
          "description": description,
          "serviceCategory": serviceCategory,
          "price": price,
          "address": address,
          "Images": propertyImages,
          "longitude": long,
          "latitude": lat,
        },
      );
      if (data.statusCode == 200) {
        // Assuming the response contains the service model data
        return Right(ServiceModel.fromJson(data.data));
      } else {
        return Left(ServerFailure.formResponse(
          data.statusCode!,
          data.data,
        ));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.formDioError(e));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }

    //   return right(ServiceModel.fromJson(data.data));
    // } catch (e) {
    //   if (e is DioException) {
    //     return left(ServerFailure.formDioError(e));
    //   } else {
    //     return left(ServerFailure(e.toString()));
    //   }
  }
}
//}
//   if (response.statusCode == 200) {
//     // Assuming the response contains the service model data
//     return Right(ServiceModel.fromJson(response.data));
//   } else {
//     return Left(ServerFailure.formResponse(
//       response.statusCode!,
//       response.data,
//     ));
//   }
// } on DioException catch (e) {
//   return Left(ServerFailure.formDioError(e));
// } catch (e) {
//   return Left(ServerFailure('Unexpected error: $e'));
// }
