import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_generator_mobile_app/core/functions/show_error_msg.dart';
import 'package:quote_generator_mobile_app/core/widgets/custom_loading_indicator.dart';
import 'package:quote_generator_mobile_app/core/widgets/try_again_button.dart';
import 'package:quote_generator_mobile_app/features/favorites/presentation/controllers/favorites_cubit/favorites_cubit.dart';

import 'quote_list_view.dart';

class QuotesListViewBlocConsumer extends StatelessWidget {
  const QuotesListViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: _listener,
      builder: (context, state) {
        if (state is FavoritesSuccess ||
            state is RemoveQuoteSuccess ||
            state is CacheQuoteSuccess) {
          return QuoteListView(
            quotes: context.read<FavoritesCubit>().quotes,
          );
        } else if (state is FavoritesFailure) {
          return TryAgainButton(
            onPressed: () => context.read<FavoritesCubit>().getAllFavorites(),
          );
        } else if (state is FavoritesSearch) {
          return QuoteListView(quotes: state.qoutes);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }

  void _listener(BuildContext context, FavoritesState state) {
    if (state is FavoritesFailure) {
      showErrorMsg(context, state.failure);
    }
  }
}
