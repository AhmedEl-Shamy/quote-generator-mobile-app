import 'package:dartz/dartz.dart';
import 'package:quote_generator_mobile_app/core/entities/quote_entity.dart';
import 'package:quote_generator_mobile_app/core/utlis/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, QuoteEntity>> getRandomQuote();
  Future<Either<Failure, void>> storeQuote(QuoteEntity qoute);
}