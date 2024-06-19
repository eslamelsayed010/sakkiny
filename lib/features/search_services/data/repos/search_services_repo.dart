import 'package:dartz/dartz.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/service.dart';

abstract class SearchServiceRepo {
  Future<Either<Failures, List<Service>>> fetchSearchService(
      {required String param});
}
