import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quote_generator_mobile_app/core/entities/quote_entity.dart';
import 'package:quote_generator_mobile_app/core/utlis/failure.dart';
import 'package:quote_generator_mobile_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:quote_generator_mobile_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:quote_generator_mobile_app/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource _remoteDataSource;
  final HomeLocalDataSource _localDataSource;

  HomeRepoImpl({
    required HomeRemoteDataSource remoteDataSource,
    required HomeLocalDataSource homeLoacalDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = homeLoacalDataSource;

  @override
  Future<Either<Failure, QuoteEntity>> getRandomQuote() async {
    try {
      QuoteEntity quote = await _remoteDataSource.getRandomQuote();
      return right(quote);
    } on DioException catch (e) {
      return left(
        ServerFailure.fromDioException(e),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> storeQuote(String qouteId) async {
    try {
      await _localDataSource.storeQuoteId(qouteId);
      return right(true);
    } on Exception catch (_){
      return left(Failure(msg: 'Unexpected error!'));
    }
  }
}
