import 'package:flutter/material.dart';

import '../../../../core/utlis/constants.dart';
import '../../../../core/widgets/quote_widget.dart';
import 'list_view_item_actions.dart';

class QuoteListViewItem extends StatelessWidget {
  const QuoteListViewItem({
    super.key,
    required this.index,
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: QuoteWidet(
        borderRadius: BorderRadius.circular(Constants.mainRadius),
        quoteStr:
            'This is Quote $index, This is Quote $index, This is Quote $index, This is Quote $index.',
        quoteAuth: 'quoteAuth',
        quoteActions: const ListViewItemActions(),
      ),
    );
  }
}
