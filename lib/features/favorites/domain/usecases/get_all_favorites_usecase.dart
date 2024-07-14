import 'package:dartz/dartz.dart';
import 'package:quote_generator_mobile_app/core/entities/quote_entity.dart';
import 'package:quote_generator_mobile_app/core/usecases/usecase.dart';
import 'package:quote_generator_mobile_app/core/utlis/failure.dart';
import 'package:quote_generator_mobile_app/features/favorites/domain/repositories/favorites_repo.dart';

class GetAllFavoritesUseCase
    extends UseCase<Future<Either<Failure, List<QuoteEntity>>>> {
  final FavoritesRepo _favoritesRepo;
  GetAllFavoritesUseCase({required FavoritesRepo favoritesRepo})
      : _favoritesRepo = favoritesRepo;
  @override
  Future<Either<Failure, List<QuoteEntity>>> call() async {
    return _favoritesRepo.getAllFavorites();
  }
}
