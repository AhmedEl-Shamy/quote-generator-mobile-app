import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  final String quoteId;
  final String quoteContent;
  final String quoteAuthor;

  const QuoteEntity({
    required this.quoteId,
    required this.quoteContent,
    required this.quoteAuthor,
  });

  @override
  List<Object?> get props => [
        quoteId,
        quoteContent,
        quoteAuthor,
      ];
}
