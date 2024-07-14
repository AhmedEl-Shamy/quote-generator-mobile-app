import 'package:flutter/material.dart';

import '../utlis/colors.dart';
import '../utlis/text_styles.dart';

class QuoteInfo extends StatelessWidget {
  const QuoteInfo({
    super.key,
    required this.quoteStr,
    required this.quoteAuth,
  });
  final String quoteStr;
  final String quoteAuth;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SelectableText(
          quoteStr,
          style: TextStyles.title.copyWith(
            color: ThemeColors.mainTextColor,
          ),
        ),
        Text(
          quoteAuth,
          textAlign: TextAlign.right,
          style: TextStyles.normal.copyWith(
            color: ThemeColors.mainTextColor.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
