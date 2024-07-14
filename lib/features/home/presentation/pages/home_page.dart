import 'package:flutter/material.dart';
import 'package:quote_generator_mobile_app/core/widgets/custom_page.dart';

import '../widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomPage(
      body: SafeArea(
        child: HomePageBody(),
      ),
    );
  }
}




