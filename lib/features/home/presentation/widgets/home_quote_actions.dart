import 'package:flutter/material.dart';

import '../../../../core/utlis/constants.dart';
import '../../../../core/utlis/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';

class HomeQuoteActions extends StatelessWidget {
  const HomeQuoteActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double widthUnit = (constraints.maxWidth - 10)/3;
        return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(
            width: widthUnit * 2,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(Constants.mainRadius),
            ),
            isFilled: true,
            onPressed: () {},
            child: const FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Generate Another Quote',
                style: TextStyles.small,
              ),
            ),
          ),
          CustomButton(
            width: widthUnit,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(Constants.mainRadius),
            ),
            isFilled: false,
            onPressed: () {},
            child: const Icon(
              Icons.favorite,
              size: 35,
            ),
          ),
        ],
      );
      },
    );
  }
}