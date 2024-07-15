import 'package:dartz/dartz.dart';
import 'package:quote_generator_mobile_app/core/usecases/usecase.dart';
import 'package:quote_generator_mobile_app/core/utlis/failure.dart';
import 'package:quote_generator_mobile_app/features/favorites/domain/repositories/favorites_repo.dart';

class StoreQuoteUseCase extends UseCaseWithParam <Future<Either<Failure, bool>>, String> {
  final FavoritesRepo _favoritesRepo;

  StoreQuoteUseCase({required FavoritesRepo favoritesRepo}) : _favoritesRepo = favoritesRepo;
  @override
  Future<Either<Failure, bool>> call(String param) {
    return _favoritesRepo.storeQuote(param);
  }

}