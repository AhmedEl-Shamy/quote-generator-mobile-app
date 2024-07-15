import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_generator_mobile_app/config/app_router.dart';
import 'package:quote_generator_mobile_app/core/services/cache_service.dart';
import 'package:quote_generator_mobile_app/core/utlis/colors.dart';
import 'package:quote_generator_mobile_app/core/utlis/dependecy_injection.dart';
import 'package:quote_generator_mobile_app/features/favorites/presentation/controllers/favorites_cubit/favorites_cubit.dart';
import 'package:quote_generator_mobile_app/features/home/presentation/controllers/random_quote_cubit.dart/random_quote_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheServiceImpl.initHive();
  setupLocator();
  runApp(const QuoteGeneratorApp());
}

class QuoteGeneratorApp extends StatelessWidget {
  const QuoteGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl.get<RandomQuoteCubit>()..getRandomQuote(),
        ),
        BlocProvider(
          create: (context) => sl.get<FavoritesCubit>()..getAllFavorites(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Quote Generator',
        theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: ThemeColors.secondGradientColor,
          ),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
