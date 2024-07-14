import 'package:flutter/material.dart';
import 'package:quote_generator_mobile_app/core/utlis/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.child,
    required this.borderRadius,
    required this.isFilled,
    required this.onPressed,
  });

  final double width;
  final Widget child;
  final BorderRadius borderRadius;
  final bool isFilled;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width,
      child: isFilled ? _createFilledButton() : _createOutlinedButton(),
    );
  }

  FilledButton _createFilledButton() {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        padding: EdgeInsets.zero,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius, side: BorderSide.none),
      ),
      child: child,
    );
  }

  OutlinedButton _createOutlinedButton() {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: ThemeColors.secondGradientColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        side: const BorderSide(
          color: ThemeColors.secondGradientColor,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      child: child,
    );
  }
}
