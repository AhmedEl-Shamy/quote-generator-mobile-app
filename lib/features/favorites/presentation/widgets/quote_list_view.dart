import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_generator_mobile_app/core/functions/show_error_msg.dart';
import 'package:quote_generator_mobile_app/core/widgets/custom_loading_indicator.dart';
import 'package:quote_generator_mobile_app/core/widgets/try_again_button.dart';
import 'package:quote_generator_mobile_app/features/favorites/presentation/controllers/favorites_cubit/favorites_cubit.dart';

import 'quote_list_view_item.dart';

class QuotesListView extends StatelessWidget {
  const QuotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: _listener,
      builder: (context, state) {
        if (state is FavoritesSuccess) {
          return ListView.builder(
            itemCount: context.read<FavoritesCubit>().quotes.length,
            itemBuilder: (context, index) => QuoteListViewItem(
              quote: context.read<FavoritesCubit>().quotes[index],
            ),
          );
        } else if (state is FavoritesFailure) {
          return SizedBox.expand(
            child: TryAgainButton(
              onPressed: () => context.read<FavoritesCubit>().getAllFavorites,
            ),
          );
        } else {
          return const SizedBox.expand(
            child: CustomLoadingIndicator(),
          );
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
