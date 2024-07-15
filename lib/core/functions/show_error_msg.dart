import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator_mobile_app/core/utlis/colors.dart';
import 'package:quote_generator_mobile_app/core/utlis/failure.dart';
import 'package:quote_generator_mobile_app/core/utlis/text_styles.dart';

void showErrorMsg(BuildContext context, Failure failure) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(
        'Error',
      ),
      content: Text(failure.msg),
      actions: [
        TextButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          child: const Text('OK'),
        )
      ],
      titleTextStyle: TextStyles.title.copyWith(
        color: ThemeColors.mainTextColor,
      ),
      contentTextStyle: TextStyles.normal.copyWith(
        color: ThemeColors.mainTextColor,
      ),
    ),
  );
}
