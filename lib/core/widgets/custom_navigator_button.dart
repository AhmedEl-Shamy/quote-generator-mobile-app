import 'package:flutter/material.dart';
import 'package:quote_generator_mobile_app/core/utlis/colors.dart';

class CustomNavigatorButton extends StatelessWidget {
  const CustomNavigatorButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.borderRadius,
  });
  final Widget child;
  final void Function() onPressed;
  final BorderRadius borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: ThemeColors.whiteColor.withOpacity(0.7),
          foregroundColor: ThemeColors.mainTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
