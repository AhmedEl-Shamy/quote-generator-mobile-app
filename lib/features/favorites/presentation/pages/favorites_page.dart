import 'package:flutter/material.dart';
import 'package:quote_generator_mobile_app/core/widgets/custom_page.dart';

import '../widgets/favorites_page_body.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      body: SafeArea(
        child: FavoritesPageBody(),
      ),
    );
  }
}


