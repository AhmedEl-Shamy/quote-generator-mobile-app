import 'package:flutter/material.dart';
import 'package:quote_generator_mobile_app/core/entities/quote_entity.dart';
import 'package:quote_generator_mobile_app/core/utlis/colors.dart';
import 'package:quote_generator_mobile_app/core/widgets/quote_info.dart';

class QuoteWidet extends StatelessWidget {
  const QuoteWidet({
    super.key,
    required this.borderRadius,
    required this.qoute,
    required this.quoteActions,
  });
  final BorderRadius borderRadius;
  final QuoteEntity qoute;
  final Widget quoteActions;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        minHeight: 200,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ThemeColors.whiteColor,
        borderRadius: borderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          QuoteInfo(
            quote: qoute,
          ),
          const SizedBox(
            height: 20,
          ),
          quoteActions,
        ],
      ),
    );
  }
}
