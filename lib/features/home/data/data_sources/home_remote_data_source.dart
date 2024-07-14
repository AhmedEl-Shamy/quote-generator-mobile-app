import 'package:quote_generator_mobile_app/core/models/quote_model.dart';
import 'package:quote_generator_mobile_app/core/services/api_service.dart';

import '../../../../core/entities/quote_entity.dart';

abstract class HomeRemoteDataSource {
  Future<QuoteEntity> getRandomQuote();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl({required ApiService apiService}) : _apiService = apiService;
  @override
  Future<QuoteEntity> getRandomQuote() async {
    const String endPoint = '/random';
    var data = await _apiService.get(endPoint);
    return QuoteModel.fromJson(data);
  }
}