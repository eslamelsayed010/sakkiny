import 'package:dio/dio.dart';

abstract class Failures {
  final String error;
  Failures(this.error);
}

class ServerFailure extends Failures {
  ServerFailure(super.error);

  factory ServerFailure.formDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with Api Service');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout With Api Service');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout With Api Service');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate With Api Service');

      case DioExceptionType.badResponse:
        return ServerFailure.formResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('Cancel Request With Api Service');

      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      //return ServerFailure('Connection Error With Api Service');

      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, please try later!');

      default:
        return ServerFailure('Oops there was an Error, please try later');
    }
  }

  factory ServerFailure.formResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      if (response is Map<String, dynamic> && response.containsKey('message')) {
        return ServerFailure(response['message'].toString());
      } else {
        return ServerFailure('Unexpected response format');
      }
    } else if (statusCode == 404) {
      return ServerFailure('Your Request Not Found, please try later');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server, please try later');
    } else {
      return ServerFailure('Oops there was an Error, please try later');
    }
  }
}
