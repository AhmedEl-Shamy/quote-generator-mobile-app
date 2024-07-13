import 'package:flutter/material.dart';
import 'package:quote_generator_mobile_app/core/utlis/colors.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({
    super.key,
    required this.body,
    this.appBar,
  });
  final Widget body;
  final PreferredSize? appBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ThemeColors.firstGradientColor,
              ThemeColors.secondGradientColor,
            ],
          ),
        ),
        child: body,
      ),
    );
  }
}
