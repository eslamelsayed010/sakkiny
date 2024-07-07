import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/features/report/data/model/report_model/report_model.dart';

abstract class ReportRepo{
  Future<Either<Failures, ReportModel>> sendReport({
    required String name,
    required String email,
    required String subject,
    required String message,
    required String contactNumber,
    MultipartFile? image,
});
}