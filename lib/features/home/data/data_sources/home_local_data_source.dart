import 'package:quote_generator_mobile_app/core/services/cache_service.dart';

abstract class HomeLocalDataSource {
  Future<void> storeQuoteId(String quoteId);
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  final CacheService _cacheService;

  HomeLocalDataSourceImpl({required CacheService cacheService})
      : _cacheService = cacheService;

  @override
  Future<void> storeQuoteId(String quoteId) {
    return _cacheService.write(quoteId);
  }
}
