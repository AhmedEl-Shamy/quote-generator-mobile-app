import 'package:flutter/material.dart';

import '../../../../core/entities/quote_entity.dart';
import '../../../../core/utlis/constants.dart';
import '../../../../core/widgets/quote_widget.dart';
import 'list_view_item_actions.dart';

class QuoteListViewItem extends StatelessWidget {
  const QuoteListViewItem({
    super.key,
    required this.quote,
  });
  final QuoteEntity quote;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: QuoteWidet(
        borderRadius: BorderRadius.circular(Constants.mainRadius),
        qoute: quote,
        quoteActions: ListViewItemActions(
          quote: quote,
        ),
      ),
    );
  }
}
