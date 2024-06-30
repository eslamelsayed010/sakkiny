import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/core/utils/end_points.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/home/data/models/user_model/user_model.dart';
import 'package:sakkiny/features/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failures, List<Property>>> fetchProperty() async {
    try {
      var data = await DioHelper.getData(url: getProperty);
      List<Property> properties = [];
      for (var homeMap in data.data['properties']) {
        properties.add(Property.fromJson(homeMap));
      }
      return right(properties);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<Property>>> fetchRecommendedProperty() async {
    try {
      var data = await DioHelper.getData(url: getProperty);
      List<Property> properties = [];
      for (var homeMap in data.data['properties']) {
        properties.add(Property.fromJson(homeMap));
      }
      return right(properties);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, UserModel>> fetchUserInfo() async {
    try {
      var data = await DioHelper.getData(url: user, token: token);
      return right(UserModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
