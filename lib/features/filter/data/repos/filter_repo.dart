import 'package:dartz/dartz.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';

abstract class FilterRepo {
  Future<Either<Failures, List<Property>>> fetchFilter({
    required int priceGte,
    required int priceLte,
    required int areaGte,
    required int areaLte,
    required String type,
    required String per,
  });
}

// price[gte]:1000
// price[lte]:5000
// area[gte]:90
// area[lte]:250
// type:Villa
// per:month
