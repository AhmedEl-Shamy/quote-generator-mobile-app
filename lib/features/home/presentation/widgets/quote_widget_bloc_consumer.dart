import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/show_error_msg.dart';
import '../../../../core/utlis/constants.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../core/widgets/quote_widget.dart';
import '../../../../core/widgets/try_again_button.dart';
import '../controllers/random_quote_cubit.dart/random_quote_cubit.dart';
import 'home_quote_actions.dart';

class QuoteWidgetBlocConsumer extends StatelessWidget {
  const QuoteWidgetBlocConsumer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RandomQuoteCubit, RandomQuoteState>(
      listener: _listener,
      buildWhen: (previous, current) =>
          !(current is CacheQuoteLoading && current is CacheQuoteSuccess),
      listenWhen: (previous, current) =>
          !(current is CacheQuoteLoading && current is CacheQuoteSuccess),
      builder: (context, state) {
        if (state is RandomQuoteSuccess) {
          return QuoteWidet(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(Constants.mainRadius),
            ),
            qoute: state.quote,
            quoteActions: HomeQuoteActions(
              quote: state.quote,
            ),
          );
        } else if (state is RandomQuoteLoading) {
          return const CustomLoadingIndicator();
        } else {
          return TryAgainButton(
            onPressed: () {
              context.read<RandomQuoteCubit>().getRandomQuote();
            },
          );
        }
      },
    );
  }

  void _listener(BuildContext context, RandomQuoteState state) {
    if (state is RandomQuoteFailure) {
      showErrorMsg(context, state.failure);
    }
  }
}
