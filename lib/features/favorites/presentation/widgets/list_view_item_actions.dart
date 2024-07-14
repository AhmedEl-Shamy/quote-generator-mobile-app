import 'package:flutter/material.dart';

import '../../../../core/utlis/constants.dart';
import '../../../../core/utlis/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';

class ListViewItemActions extends StatelessWidget {
  const ListViewItemActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: double.infinity,
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(
          Constants.mainRadius,
        ),
      ),
      isFilled: false,
      onPressed: () {},
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border_outlined,
            size: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Remove From Favorite',
            style: TextStyles.normal,
          ),
        ],
      ),
    );
  }
}
