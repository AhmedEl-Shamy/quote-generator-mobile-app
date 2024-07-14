import 'package:flutter/material.dart';

import '../../../../core/utlis/colors.dart';
import '../../../../core/utlis/constants.dart';
import '../../../../core/utlis/text_styles.dart';
import '../../../../core/widgets/custom_navigator_button.dart';

class GoToFavoritesButton extends StatelessWidget {
  const GoToFavoritesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomNavigatorButton(
              onPressed: () {},
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(
                  Constants.mainRadius,
                ),
              ),
              child: const Text(
                'Click Here To View Favorite Quotes',
                style: TextStyles.title,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: ThemeColors.mainTextColor,
              foregroundColor: ThemeColors.whiteColor,
              radius: 16,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '2',
                  style: TextStyles.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
