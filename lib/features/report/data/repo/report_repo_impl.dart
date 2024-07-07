// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/features/report/data/model/report_model/report_model.dart';
import 'package:sakkiny/features/report/data/repo/report_repo.dart';
import '../../../../../core/utils/end_points.dart';

class ReportRepoImpl extends ReportRepo {
  @override
  Future<Either<Failures, ReportModel>> sendReport({
    required String name,
    required String email,
    required String subject,
    required String message,
    required String contactNumber,
    MultipartFile? image,
  }) async {
    try {
      var data;
      if (image != null) {
        data = await DioHelper.postDataWithImage(
          url: userFeedback,
          token: token,
          data: {
            'name': name,
            'email': email,
            'subject': subject,
            'message': message,
            'contactNumber': contactNumber,
            'Image': image,
          },
        );
      } else {
        data = await DioHelper.postData(
          url: userFeedback,
          token: token,
          data: {
            'name': name,
            'email': email,
            'subject': subject,
            'message': message,
            'contactNumber': contactNumber,
          },
        );
      }
      return right(ReportModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
