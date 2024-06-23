import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/features/add/data/models/add_property_model/add_property_model.dart';

abstract class AddRepo {
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
  });
}
