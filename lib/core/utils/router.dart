import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/view_models/author_books_bloc/author_books_bloc.dart';
import 'package:bookly/features/home/presentation/views/home_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            pageBuilder: (context, state) => _slideTransitionPage(
              child: BlocProvider<AuthorBooksBloc>(
                create: (context) =>
                    AuthorBooksBloc(homeRepo: HomeRepoImpl.instance)..add(
                      FetchAuthorBooksEvent(
                        authorName: (state.extra as BookModel).author,
                      ),
                    ),
                child: HomeDetailsView(book: state.extra as BookModel),
              ),
            ),
          ),
        ],
      ),
    ],
  );

  static CustomTransitionPage<dynamic> _slideTransitionPage({
    required Widget child,
  }) {
    return CustomTransitionPage(
      child: child,
      transitionsBuilder: (_, animation, _, child) => SlideTransition(
        position: animation.drive<Offset>(
          Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero),
        ),
        child: child,
      ),
    );
  }
}
