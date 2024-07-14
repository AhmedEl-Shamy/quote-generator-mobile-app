import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:quote_generator_mobile_app/core/entities/quote_entity.dart';
import 'package:quote_generator_mobile_app/core/usecases/usecase.dart';
import 'package:quote_generator_mobile_app/core/utlis/failure.dart';
import 'package:quote_generator_mobile_app/features/home/domain/repositories/home_repo.dart';

class StoreQuoteUseCase extends UseCaseWithParam <Future<Either<Failure, void>>, QuoteEntity> {
  final HomeRepo _homeRepo;

  StoreQuoteUseCase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;
  @override
  Future<Either<Failure, void>> call(QuoteEntity param) {
    return _homeRepo.storeQuote(param);
  }

}