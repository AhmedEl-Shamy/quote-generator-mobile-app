import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_generator_mobile_app/core/entities/quote_entity.dart';
import 'package:quote_generator_mobile_app/core/utlis/failure.dart';
import 'package:quote_generator_mobile_app/features/favorites/domain/usecases/get_all_favorites_usecase.dart';
import 'package:quote_generator_mobile_app/features/favorites/domain/usecases/remove_quote_usecase.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final GetAllFavoritesUseCase _getAllFavoritesUseCase;
  final RemoveQuoteUseCase _removeQuoteUseCase;
  final List<QuoteEntity> quotes = [];
  FavoritesCubit({
    required GetAllFavoritesUseCase getAllFavoritesUseCase,
    required RemoveQuoteUseCase removeQuoteUseCase,
  })  : _getAllFavoritesUseCase = getAllFavoritesUseCase,
        _removeQuoteUseCase = removeQuoteUseCase,
        super(FavoritesInitial());

  Future<void> getAllFavorites() async {
    Either<Failure, List<QuoteEntity>> data =
        await _getAllFavoritesUseCase.call();
    data.fold(
      (failure) => emit(FavoritesFailure(failure: failure)),
      (favorites) {
        quotes.addAll(favorites);
        emit(FavoritesSuccess());
      },
    );
  }

  Future<void> removeQuote(String quoteId) async {
    await _removeQuoteUseCase.call(quoteId);
    quotes.removeWhere(
      (element) => element.quoteId == quoteId,
    );
    emit(FavoritesSuccess());
  }

  void search(String str) {
    if(quotes.isEmpty){
      return;
    }
    List<QuoteEntity> filteredQuotes =  quotes.where(
      (element) {
        if (element.quoteContent.contains(str)) {
          return true;
        }else if (element.quoteAuthor.contains(str)) {
          return true;
        }
        return false;
      },
    ).toList();
    emit(FavoritesSearch(qoutes: filteredQuotes));
  }
}
