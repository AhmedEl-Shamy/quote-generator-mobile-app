import 'package:flutter/material.dart';
import 'package:quote_generator_mobile_app/core/utlis/colors.dart';
import 'package:quote_generator_mobile_app/core/utlis/constants.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: ThemeColors.whiteColor,
        borderRadius: BorderRadiusDirectional.circular(
          Constants.mainRadius,
        ),
      ),
      child: const CircularProgressIndicator(),
    );
  }
}
