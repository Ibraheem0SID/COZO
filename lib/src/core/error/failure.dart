import 'package:supabase_flutter/supabase_flutter.dart';

abstract class Failure {
  final String message;

  const Failure(this.message);
}

class RequestFail extends Failure {
  RequestFail(super.message);

  factory RequestFail.fromSupabaseError(Exception exception) {
    if (exception is AuthException) {
      return RequestFail.fromAuthException(exception);
      print('Auth Exception!');
    }
    if (exception is PostgrestException) {
      return RequestFail('Send request timeout');
    }
    if (exception is StorageException) {
      return RequestFail('Send request timeout');
    }
    if (exception is FunctionException) {
      return RequestFail('Send request timeout');
    }
    return RequestFail('حصل خطأ ما');
  }

  factory RequestFail.fromAuthException(AuthException exception) {
    String? message = exception.message;
    String? code = exception.statusCode;

    if (code == '400' || code == '401' || code == '403') {
      return RequestFail('Server error, please try again later');
    } else if (code == 500) {
      return RequestFail('Connection error');
    }
    return RequestFail('Oops unknown error');
  }

  factory RequestFail.fromPostgrestException(PostgrestException exception) {
    String? message = exception.message;
    String? code = exception.code;

    if (code == '400' || code == '401' || code == '403') {
      return RequestFail('Server error, please try again later');
    } else if (code == 500) {
      return RequestFail('Connection error');
    }
    return RequestFail('Oops unknown error');
  }

  factory RequestFail.fromStorageException(StorageException exception) {
    String? message = exception.message;
    String? code = exception.statusCode;

    if (code == 400 || code == 401 || code == 403) {
      return RequestFail('Server error, please try again later');
    } else if (code == 500) {
      return RequestFail('Connection error');
    }
    return RequestFail('Oops unknown error');
  }

  factory RequestFail.fromFunctionException(FunctionException exception) {
    String? message = exception.reasonPhrase;
    int? code = exception.status;

    if (code == 400 || code == 401 || code == 403) {
      return RequestFail('Server error, please try again later');
    } else if (code == 500) {
      return RequestFail('Connection error');
    }
    return RequestFail('Oops unknown error');
  }
}
