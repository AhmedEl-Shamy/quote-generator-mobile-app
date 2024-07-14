import 'package:quote_generator_mobile_app/core/models/quote_model.dart';
import 'package:quote_generator_mobile_app/core/services/api_service.dart';

import '../../../../core/entities/quote_entity.dart';

abstract class FavoritesRemoteDataSource {
  Future<List<QuoteEntity>> getAllFavorites(List<String> quoteIds);
}

class FavoritesRemoteDataSourceImpl extends FavoritesRemoteDataSource {
  final ApiService _apiService;

  FavoritesRemoteDataSourceImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<List<QuoteEntity>> getAllFavorites(List<String> quoteIds) async {
    List<QuoteEntity> quots = [];
    for (int i = 0; i < quoteIds.length; i++) {
      Map<String, dynamic> data = await _apiService.get('/quotes/${quoteIds[i]}');
      QuoteEntity quote = QuoteModel.fromJson(data);
      quots.add(quote);
    }
    return quots;
  }
}
