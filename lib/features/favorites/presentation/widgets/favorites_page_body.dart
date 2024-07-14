import 'package:flutter/material.dart';
import 'package:quote_generator_mobile_app/features/favorites/presentation/widgets/custom_text_field.dart';

import '../../../../core/utlis/constants.dart';
import '../../../../core/utlis/text_styles.dart';
import '../../../../core/widgets/custom_navigator_button.dart';
import 'quote_list_view.dart';

class FavoritesPageBody extends StatelessWidget {
  FavoritesPageBody({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CustomNavigatorButton(
            onPressed: () {},
            borderRadius: BorderRadius.circular(
              Constants.mainRadius,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back_ios),
                Text(
                  'Back To Home Screen',
                  style: TextStyles.title,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: controller,
          ),
          const SizedBox(
            height: 10,
          ),
          const Expanded(
            child: QuotesListView(),
          ),
        ],
      ),
    );
  }
}






