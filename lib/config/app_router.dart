import 'package:go_router/go_router.dart';
import 'package:quote_generator_mobile_app/features/favorites/presentation/pages/favorites_page.dart';
import 'package:quote_generator_mobile_app/features/home/presentation/pages/home_page.dart';

abstract class AppRouter {
  static const String homeRoute = '/';
  static const String favoritesRoute = '/favorites';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: homeRoute,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: favoritesRoute,
        builder: (context, state) => const FavoritesPage(),
      ),
    ],
  );
}
