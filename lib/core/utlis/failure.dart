import 'package:http/http.dart' as http;
class Failure {
  final String msg;

  Failure({required this.msg});
}

class ServerFailure extends Failure {
  ServerFailure({required super.msg});

  factory ServerFailure.fromResponse(http.Response response) {
    int statusCode = response.statusCode;
    if (statusCode >= 500){
      return ServerFailure(msg: 'Internal Server Error!');
    } else {
      return ServerFailure(msg: 'Field to connect with server, check your internet connection!');
    }
  }

}
