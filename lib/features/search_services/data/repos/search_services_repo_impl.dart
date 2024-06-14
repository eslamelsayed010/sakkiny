// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:lomaTV/core/errors/failures.dart';
// import 'package:lomaTV/core/utils/api_services.dart';
// import 'package:lomaTV/features/home/data/models/movie_model.dart';
// import 'package:lomaTV/features/search/data/repos/search_services_repo.dart';
//
// class SearchRepoImpl extends SearchRepo {
//   final ApiServices apiServices;
//
//   SearchRepoImpl(this.apiServices);
//   @override
//   Future<Either<Failures, List<MovieModel>>> fetchSearchMovie(
//       {required String movieName}) async {
//     try {
//       var data = await apiServices.getByName(
//           endPoint: 'search/movie', name: movieName);
//       List<MovieModel> movies = [];
//       for (var movieMap in data['results']) {
//         movies.add(MovieModel.fromJson(movieMap));
//       }
//       return right(movies);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.formDioError(e));
//       } else {
//         return left(ServerFailure(e.toString()));
//       }
//     }
//   }
// }
