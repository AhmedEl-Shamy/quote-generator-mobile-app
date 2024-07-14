part of 'random_quote_cubit.dart';

sealed class RandomQuoteState extends Equatable {
  const RandomQuoteState();

  @override
  List<Object> get props => [];
}

final class RandomQuoteInitial extends RandomQuoteState {}
final class RandomQuoteLoading extends RandomQuoteState {}
final class RandomQuoteSuccess extends RandomQuoteState {
  final QuoteEntity quote;

  const RandomQuoteSuccess({required this.quote});

}
final class RandomQuoteFailure extends RandomQuoteState {
  final Failure failure;

  const RandomQuoteFailure({required this.failure});
}
