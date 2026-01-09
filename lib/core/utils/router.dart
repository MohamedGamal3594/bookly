import 'package:bookly/features/home/presentation/views/home_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const splashView = '/';
  static const homeView = '/home';
  static const homeDetailsView = '/homeDetails';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
        routes: [
          GoRoute(
            path: homeDetailsView,
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const HomeDetailsView(),
              transitionsBuilder: (_, animation, _, child) => SlideTransition(
                position: animation.drive<Offset>(
                  Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero),
                ),
                child: child,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
