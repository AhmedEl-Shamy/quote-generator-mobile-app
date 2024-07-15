import 'package:dartz/dartz.dart';
import 'package:quote_generator_mobile_app/core/entities/quote_entity.dart';
import 'package:quote_generator_mobile_app/core/utlis/failure.dart';

abstract class FavoritesRepo {
  Future<void> removeQuote(String quoteId);
  Future<Either<Failure, List<QuoteEntity>>> getAllFavorites();
  Future<Either<Failure, bool>> storeQuote(String qouteId);
}