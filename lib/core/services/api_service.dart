import 'package:dio/dio.dart';

abstract class ApiService{
  Future get (String endPoint);
}

class ApiServiceImpl<T> extends ApiService{
  final Dio _dio;
  static const String baseUrl = 'https://api.quotable.io';

  ApiServiceImpl({required Dio dio}) : _dio = dio;
  @override
  Future<Map<String, dynamic>> get(String endPoint) async {
    Response response = await _dio.get(baseUrl+endPoint);
    return response.data;
  }
}