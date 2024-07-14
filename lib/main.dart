import 'package:flutter/material.dart';
import 'package:quote_generator_mobile_app/core/services/cache_service.dart';
import 'package:quote_generator_mobile_app/core/utlis/colors.dart';
import 'package:quote_generator_mobile_app/core/utlis/dependecy_injection.dart';
import 'package:quote_generator_mobile_app/features/favorites/presentation/pages/favorites_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await CacheServiceImpl.initHive();
  runApp(const QuoteGeneratorApp());
}

class QuoteGeneratorApp extends StatelessWidget {
  const QuoteGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote Generator',
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ThemeColors.secondGradientColor,
        ),
      ),
      home: const FavoritesPage(),
    );
  }
}
