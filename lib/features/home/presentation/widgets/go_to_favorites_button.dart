import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator_mobile_app/config/app_router.dart';
import 'package:quote_generator_mobile_app/features/favorites/presentation/controllers/favorites_cubit/favorites_cubit.dart';

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
              onPressed: () {
                GoRouter.of(context).push(AppRouter.favoritesRoute);
              },
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(
                  Constants.mainRadius,
                ),
              ),
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Click Here To View Favorite Quotes',
                  style: TextStyles.title,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: BlocBuilder<FavoritesCubit, FavoritesState>(
              buildWhen: (previous, current) =>
                  current is CacheQuoteSuccess ||
                  current is RemoveQuoteSuccess ||
                  current is FavoritesSuccess,
              builder: (context, state) {
                return CircleAvatar(
                  backgroundColor: ThemeColors.mainTextColor,
                  foregroundColor: ThemeColors.whiteColor,
                  radius: 16,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      context.read<FavoritesCubit>().quotes.length.toString(),
                      style: TextStyles.normal,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
