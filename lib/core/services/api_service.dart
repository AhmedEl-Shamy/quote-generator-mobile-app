// import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quote_generator_mobile_app/core/utlis/exceptions.dart';

abstract class ApiService{
  Future get (String endPoint);
}

class ApiServiceImpl extends ApiService {
  static const String baseUrl = 'https://api.quotable.io';
  final http.Client client;

  ApiServiceImpl({required this.client});
  @override
  Future<Map<String, dynamic>> get(String endPoint) async {
    http.Response response = await client.get(Uri.parse('$baseUrl$endPoint'));
    if (response.statusCode != 200) {
      throw InternetException(response: response);
    }else{
      return json.decode(response.body);
    }
  }
}
