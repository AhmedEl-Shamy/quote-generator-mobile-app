import 'package:dartz/dartz.dart';
import 'package:quote_generator_mobile_app/core/entities/quote_entity.dart';
import 'package:quote_generator_mobile_app/core/usecases/usecase.dart';
import 'package:quote_generator_mobile_app/core/utlis/failure.dart';
import 'package:quote_generator_mobile_app/features/home/domain/repositories/home_repo.dart';

class GetRandomQuoteUseCase extends UseCase<Future<Either<Failure, QuoteEntity>>> {
  final HomeRepo _homeRepo;

  GetRandomQuoteUseCase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;
  @override
  Future<Either<Failure, QuoteEntity>> call() {
    return _homeRepo.getRandomQuote();
  }
}
