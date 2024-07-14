import 'package:flutter/material.dart';

import 'quote_list_view_item.dart';

class QuotesListView extends StatelessWidget {
  const QuotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) => QuoteListViewItem(
        index: index,
      ),
    );
  }
}
