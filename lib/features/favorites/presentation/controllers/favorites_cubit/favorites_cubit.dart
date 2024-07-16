import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_generator_mobile_app/core/entities/quote_entity.dart';
import 'package:quote_generator_mobile_app/core/utlis/failure.dart';
import 'package:quote_generator_mobile_app/features/favorites/domain/usecases/get_all_favorites_usecase.dart';
import 'package:quote_generator_mobile_app/features/favorites/domain/usecases/remove_quote_usecase.dart';
import 'package:quote_generator_mobile_app/features/favorites/domain/usecases/store_quote_usecase.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final GetAllFavoritesUseCase _getAllFavoritesUseCase;
  final RemoveQuoteUseCase _removeQuoteUseCase;
  final StoreQuoteUseCase _storeQuoteUseCase;
  final List<QuoteEntity> quotes = [];
  FavoritesCubit({
    required GetAllFavoritesUseCase getAllFavoritesUseCase,
    required RemoveQuoteUseCase removeQuoteUseCase,
    required StoreQuoteUseCase storeQuoteUseCase,
  })  : _getAllFavoritesUseCase = getAllFavoritesUseCase,
        _removeQuoteUseCase = removeQuoteUseCase,
        _storeQuoteUseCase = storeQuoteUseCase,
        super(FavoritesInitial());

  Future<void> getAllFavorites() async {
    emit(FavoritesLoading());
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

  Future<void> storeQuote(QuoteEntity quote) async {
    Either<Failure, bool> data = await _storeQuoteUseCase.call(quote.quoteId);
    data.fold(
      (failure) => emit(FavoritesFailure(failure: failure)),
      (data) {
        if (!quotes.contains(quote)) {
          quotes.add(quote);
        }
        emit(CacheQuoteSuccess());
      },
    );
  }

  Future<void> removeQuote(String quoteId) async {
    await _removeQuoteUseCase.call(quoteId);
    quotes.removeWhere(
      (element) => element.quoteId == quoteId,
    );
    emit(RemoveQuoteSuccess());
  }

  void search(String str) {
    if (quotes.isEmpty) {
      return;
    }
    List<QuoteEntity> filteredQuotes = quotes.where(
      (element) {
        if (element.quoteContent.toLowerCase().contains(str.toLowerCase())) {
          return true;
        } else if (element.quoteAuthor
            .toLowerCase()
            .contains(str.toLowerCase())) {
          return true;
        }
        return false;
      },
    ).toList();
    emit(FavoritesSearch(qoutes: filteredQuotes));
  }
}
