import 'package:quote_generator_mobile_app/core/usecases/usecase.dart';
import 'package:quote_generator_mobile_app/features/favorites/domain/repositories/favorites_repo.dart';

class RemoveQuoteUseCase extends UseCaseWithParam<Future<void>, String> {
  final FavoritesRepo _favoritesRepo;

  RemoveQuoteUseCase({required FavoritesRepo favoritesRepo}) : _favoritesRepo = favoritesRepo;
  @override
  Future<void> call(String param) {
    return _favoritesRepo.removeQuote(param);
  }

}