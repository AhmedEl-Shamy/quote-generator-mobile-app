import 'package:http/http.dart' as http;

class InternetException implements Exception {
  final http.Response response;

  InternetException({required this.response});
}

