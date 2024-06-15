import 'package:dartz/dartz.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';

abstract class SelectRepo {
  Future<Either<Failures, Property>> fetchSelectProperty(
      {required String idProperty});
}
