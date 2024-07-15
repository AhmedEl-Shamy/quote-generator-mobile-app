import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quote_generator_mobile_app/core/entities/quote_entity.dart';
import 'package:quote_generator_mobile_app/core/utlis/failure.dart';
import 'package:quote_generator_mobile_app/features/home/domain/usecases/get_random_quote_usecase.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuoteUseCase _getRandomQuoteUseCase;
  RandomQuoteCubit({
    required GetRandomQuoteUseCase getRandomQuoteUseCase,
  })  : _getRandomQuoteUseCase = getRandomQuoteUseCase,
        super(RandomQuoteInitial());

  Future<void> getRandomQuote() async {
    emit(RandomQuoteLoading());
    Either<Failure, QuoteEntity> data = await _getRandomQuoteUseCase.call();
    data.fold(
      (failure) => emit(RandomQuoteFailure(failure: failure)),
      (quote) => emit(
        RandomQuoteSuccess(
          quote: quote,
        ),
      ),
    );
  }
}
