import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_generator_mobile_app/core/entities/quote_entity.dart';
import 'package:quote_generator_mobile_app/features/home/presentation/controllers/random_quote_cubit.dart/random_quote_cubit.dart';

import '../../../../core/utlis/constants.dart';
import '../../../../core/utlis/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import 'store_quote_button_bloc_listener.dart';

class HomeQuoteActions extends StatelessWidget {
  const HomeQuoteActions({
    super.key,
    required this.quote,
  });

  final QuoteEntity quote;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double widthUnit = (constraints.maxWidth - 10) / 3;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              width: widthUnit * 2,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(Constants.mainRadius),
              ),
              isFilled: true,
              onPressed: () {
                context.read<RandomQuoteCubit>().getRandomQuote();
              },
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Generate Another Quote',
                  style: TextStyles.small,
                ),
              ),
            ),
            StoreQuoteButtonBlocListener(
              quote: quote,
              widthUnit: widthUnit,
            ),
          ],
        );
      },
    );
  }
}
