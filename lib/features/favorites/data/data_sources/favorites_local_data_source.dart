import 'package:quote_generator_mobile_app/core/services/cache_service.dart';

abstract class FavoritesLocalDataSource {
  Future<void> removeQuote(String quoteId);
  List<String> getAllFavorites();
}

class FavoritesLocalDataSourceImpl extends FavoritesLocalDataSource {
  final CacheService _cacheService;

  FavoritesLocalDataSourceImpl({required CacheService cacheService})
      : _cacheService = cacheService;

  @override
  List<String> getAllFavorites() {
    List<String> cachedQuotesIds = _cacheService.readAll();
    return cachedQuotesIds;
  }

  @override
  Future<void> removeQuote(String quoteId) async {
    await _cacheService.delete(quoteId);
  }
}
