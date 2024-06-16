import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/features/add_service/data/model/service_model/service_model.dart';

abstract class AddService {
  Future<Either<Failures, ServiceModel>> addService({
    required int price,
    required String serviceCategory,
    required String address,
    required num lat,
    required num long,
    required List<MultipartFile> propertyImages,
    required String description,
  });
}
