import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_generator_mobile_app/core/entities/quote_entity.dart';
import 'package:quote_generator_mobile_app/features/favorites/presentation/controllers/favorites_cubit/favorites_cubit.dart';

import '../../../../core/utlis/constants.dart';
import '../../../../core/utlis/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';

class ListViewItemActions extends StatelessWidget {
  const ListViewItemActions({
    super.key, required this.quote,
  });
  final QuoteEntity quote;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: double.infinity,
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(
          Constants.mainRadius,
        ),
      ),
      isFilled: false,
      onPressed: () {
        context.read<FavoritesCubit>().removeQuote(quote.quoteId);
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border_outlined,
            size: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Remove From Favorite',
            style: TextStyles.normal,
          ),
        ],
      ),
    );
  }
}
