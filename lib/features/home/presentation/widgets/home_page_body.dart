import 'package:flutter/material.dart';

import 'go_to_favorites_button.dart';
import 'quote_widget_bloc_consumer.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GoToFavoritesButton(),
          SizedBox(
            height: 10,
          ),
          QuoteWidgetBlocConsumer()
        ],
      ),
    );
  }

  
}


