import 'package:dio/dio.dart';

class ApiServices {
  ApiServices(this._dio);
  late final Dio _dio;

  final baseUrl = 'https://api.themoviedb.org/3/';
  final apiKey = "?api_key=4964cfa7f744211844b381c02a6e3fb1";

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint$apiKey');
    return response.data;
  }

  Future<Map<String, dynamic>> getById({
    required String endPoint,
    required num id,
  }) async {
    var response = await _dio.get(
      '$baseUrl$endPoint$apiKey',
      queryParameters: {
        'with_genres': id,
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getByName({
    required String endPoint,
    required String name,
  }) async {
    var response = await _dio.get(
      '$baseUrl$endPoint$apiKey',
      queryParameters: {
        'query': name,
      },
    );
    return response.data;
  }
}
// Map<String, dynamic>? query,
