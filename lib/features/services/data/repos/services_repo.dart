import 'package:dartz/dartz.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

abstract class ServiceRepo {
  Future<Either<Failures, List<Service>>> fetchService();
  // Future<Either<Failures, List<Service>>> fetchRecommendedService();
}
