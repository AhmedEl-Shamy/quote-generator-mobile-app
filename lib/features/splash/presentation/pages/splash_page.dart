import 'package:flutter/material.dart';
import 'package:quote_generator_mobile_app/core/widgets/custom_page.dart';

import '../widgets/splash_page_body.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomPage(
      body: SplashPageBody(),
    );
  }
}
