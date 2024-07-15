import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/quote_entity.dart';
import '../../../../core/functions/show_snack_bar.dart';
import '../../../../core/utlis/constants.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../favorites/presentation/controllers/favorites_cubit/favorites_cubit.dart';

class StoreQuoteButtonBlocListener extends StatelessWidget {
  const StoreQuoteButtonBlocListener({
    super.key,
    required this.quote,
    required this.widthUnit,
  });

  final QuoteEntity quote;
  final double widthUnit;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoritesCubit, FavoritesState>(
      listener: _listener,
      child: CustomButton(
        width: widthUnit,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(Constants.mainRadius),
        ),
        isFilled: false,
        onPressed: () async {
          await context.read<FavoritesCubit>().storeQuote(quote);
        },
        child: const Icon(
          Icons.favorite,
          size: 35,
        ),
      ),
    );
  }

  void _listener(context, state) {
    if (state is CacheQuoteSuccess) {
      showSnackBar(
        context: context,
        msg: 'The quote is saved successfully',
      );
    }
  }
}