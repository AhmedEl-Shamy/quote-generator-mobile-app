import 'package:flutter/material.dart';
import 'package:quote_generator_mobile_app/core/utlis/constants.dart';

import 'home_quote_actions.dart';
import 'quote_widget.dart';

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
          QuoteWidet(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(Constants.mainRadius),
            ),
            quoteStr:
                '“All I required to be happy was friendship and people I could admire.”',
            quoteAuth: 'Christian Dior',
            quoteActions: HomeQuoteActions(),
          ),
        ],
      ),
    );
  }
}

