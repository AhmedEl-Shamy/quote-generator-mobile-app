import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/app_router.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../../../favorites/presentation/controllers/favorites_cubit/favorites_cubit.dart';

class SplashPageBody extends StatelessWidget {
  const SplashPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoritesCubit, FavoritesState>(
      listener: _listener,
      child: const Center(
        child: CustomLoadingIndicator(),
      ),
    );
  }

  void _listener(BuildContext context, FavoritesState state) {
    GoRouter.of(context).pushReplacement(AppRouter.homeRoute);
  }
}