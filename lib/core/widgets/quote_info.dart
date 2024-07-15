import 'package:flutter/material.dart';
import 'package:quote_generator_mobile_app/core/entities/quote_entity.dart';

import '../utlis/colors.dart';
import '../utlis/text_styles.dart';

class QuoteInfo extends StatelessWidget {
  const QuoteInfo({
    super.key,
    required this.quote,
  });
  final QuoteEntity quote;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SelectableText(
          quote.quoteContent,
          style: TextStyles.title.copyWith(
            color: ThemeColors.mainTextColor,
          ),
        ),
        Text(
          quote.quoteAuthor,
          textAlign: TextAlign.right,
          style: TextStyles.normal.copyWith(
            color: ThemeColors.mainTextColor.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
