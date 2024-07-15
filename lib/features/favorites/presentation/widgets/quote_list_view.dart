
import 'package:flutter/material.dart';

import '../../../../core/entities/quote_entity.dart';
import 'quote_list_view_item.dart';

class QuoteListView extends StatelessWidget {
  const QuoteListView({
    super.key,
    required this.quotes,
  });
  final List<QuoteEntity> quotes;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (context, index) => QuoteListViewItem(
          quote: quotes[index],
        ),
      ),
    );
  }
}