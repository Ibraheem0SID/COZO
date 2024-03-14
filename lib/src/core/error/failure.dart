import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  const Failure(this.message);
}

class RequestFail extends Failure {
  RequestFail(super.message);

  factory RequestFail.fromDioError(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.sendTimeout:
        return RequestFail('Send request timeout');
      case DioExceptionType.connectionTimeout:
        return RequestFail('Connection timeout');
      case DioExceptionType.cancel:
        return RequestFail('Request canceled ');
      case DioExceptionType.receiveTimeout:
        return RequestFail('Receive request timeout');
      case DioExceptionType.badResponse:
        return RequestFail.fromBadRequest(exception);
      case DioExceptionType.unknown:
        return RequestFail('Unknown error try again later');
      default:
        return RequestFail('Unknown error occur');
    }
  }

  factory RequestFail.fromBadRequest(DioException exception) {
    String? message = exception.response?.data['error']['message'];
    int? code = exception.response?.statusCode;

    if (code == 400 || code == 401 || code == 403) {
      return RequestFail('Server error, please try again later');
    } else if (code == 500) {
      return RequestFail('Connection error');
    }
    return RequestFail('Oops unknown error');
  }
}