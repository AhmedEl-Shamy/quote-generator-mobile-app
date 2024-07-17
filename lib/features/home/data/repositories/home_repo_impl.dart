import 'package:dartz/dartz.dart';
import 'package:quote_generator_mobile_app/core/entities/quote_entity.dart';
import 'package:quote_generator_mobile_app/core/utlis/exceptions.dart';
import 'package:quote_generator_mobile_app/core/utlis/failure.dart';
import 'package:quote_generator_mobile_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:quote_generator_mobile_app/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepoImpl({
    required HomeRemoteDataSource remoteDataSource,
  })  : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, QuoteEntity>> getRandomQuote() async {
    try {
      QuoteEntity quote = await _remoteDataSource.getRandomQuote();
      return right(quote);
    } on InternetException catch (e) {
      return left(
        ServerFailure.fromResponse(e.response),
      );
    }
  }
}
