import 'package:dio/dio.dart';

class Failure {
  final String msg;

  Failure({required this.msg});
}

class ServerFailure extends Failure {
  ServerFailure({required super.msg});

  factory ServerFailure.fromDioException(DioException exception) {
    DioExceptionType type = exception.type;
    switch (type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(msg: 'Connection timeout!');
      case DioExceptionType.sendTimeout:
        return ServerFailure(msg: 'Connection timeout!');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(msg: 'Connection timeout!');
      case DioExceptionType.badCertificate:
        return ServerFailure(msg: 'Connection timeout!');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(exception.response!);
      case DioExceptionType.cancel:
        return ServerFailure(msg: 'Connection Canceled!');
      case DioExceptionType.connectionError:
        return ServerFailure(msg: 'Connection error, please try again!');
      case DioExceptionType.unknown:
        return ServerFailure(
            msg: 'Unexpected connection error, please try again!');
    }
  }

  factory ServerFailure.fromResponse(Response response) {
    int statusCode = response.statusCode!;
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(msg: 'Bad Request!');
    } else if (statusCode == 404) {
      return ServerFailure(msg: 'Request not found!');
    } else if (statusCode >= 500) {
      return ServerFailure( msg: 'There was a problem with server, please try later!');
    } else {
      return ServerFailure(msg: 'Oops!, there was an error, Please try again!');
    }
  }
}
