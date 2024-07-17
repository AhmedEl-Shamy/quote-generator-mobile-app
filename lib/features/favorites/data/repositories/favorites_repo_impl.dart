import 'package:dartz/dartz.dart';
import 'package:quote_generator_mobile_app/core/entities/quote_entity.dart';
import 'package:quote_generator_mobile_app/core/utlis/exceptions.dart';
import 'package:quote_generator_mobile_app/core/utlis/failure.dart';
import 'package:quote_generator_mobile_app/features/favorites/data/data_sources/favorites_local_data_source.dart';
import 'package:quote_generator_mobile_app/features/favorites/data/data_sources/favorites_remote_data_source.dart';
import 'package:quote_generator_mobile_app/features/favorites/domain/repositories/favorites_repo.dart';

class FavoritesRepoImpl extends FavoritesRepo {
  final FavoritesLocalDataSource _favoritesLocalDataSource;
  final FavoritesRemoteDataSource _favoritesRemoteDataSource;

  FavoritesRepoImpl({
    required FavoritesLocalDataSource favoritesLocalDataSource,
    required FavoritesRemoteDataSource favoritesRemoteDataSource,
  })  : _favoritesLocalDataSource = favoritesLocalDataSource,
        _favoritesRemoteDataSource = favoritesRemoteDataSource;

  @override
  Future<Either<Failure, List<QuoteEntity>>> getAllFavorites() async {
    List<String> quotesIds = _favoritesLocalDataSource.getAllFavorites();
    if (quotesIds.isEmpty) {
      return right(<QuoteEntity>[]);
    }
    try {
      List<QuoteEntity> quotes =
          await _favoritesRemoteDataSource.getAllFavorites(quotesIds);
      return right(quotes);
    } on InternetException catch (e) {
      return left(ServerFailure.fromResponse(e.response));
    }
  }

  @override
  Future<void> removeQuote(String quoteId) {
    return _favoritesLocalDataSource.removeQuote(quoteId);
  }

  @override
  Future<Either<Failure, bool>> storeQuote(String qouteId) async {
    try {
      await _favoritesLocalDataSource.storeQuoteId(qouteId);
      return right(true);
    } on Exception catch (_){
      return left(Failure(msg: 'Unexpected error!'));
    }
  }
}
