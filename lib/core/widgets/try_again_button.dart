import 'package:flutter/material.dart';
import 'package:quote_generator_mobile_app/core/utlis/colors.dart';
import 'package:quote_generator_mobile_app/core/utlis/constants.dart';

class TryAgainButton extends StatelessWidget {
  const TryAgainButton({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: IconButton.filled(
        style: IconButton.styleFrom(
          foregroundColor: ThemeColors.secondGradientColor,
          backgroundColor: ThemeColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Constants.mainRadius,
            ),
          ),
        ),
        onPressed: onPressed,
        icon: const Icon(Icons.refresh),
        iconSize: 60,
      ),
    );
  }
}
