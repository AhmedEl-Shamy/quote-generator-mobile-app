import 'package:flutter/material.dart';
import 'package:quote_generator_mobile_app/core/utlis/colors.dart';
import 'package:quote_generator_mobile_app/core/utlis/constants.dart';
import 'package:quote_generator_mobile_app/core/utlis/text_styles.dart';

void showSnackBar({
  required BuildContext context,
  required String msg,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        style: TextStyles.normal.copyWith(
          color: ThemeColors.mainTextColor,
        ),
      ),
      backgroundColor: ThemeColors.whiteColor,
      showCloseIcon: true,
      closeIconColor: ThemeColors.firstGradientColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            Constants.mainRadius,
          ),
        ),
      ),
    ),
  );
}
