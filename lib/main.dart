import 'dart:io';
import 'package:bookly/core/utils/router.dart';
import 'package:bookly/core/utils/theme.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/view_models/new_books_bloc/new_books_bloc.dart';
import 'package:bookly/features/home/presentation/view_models/relevant_books_bloc/relevant_books_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !Platform.isAndroid && !kReleaseMode,
      builder: (context) => const BooklyApp(),
    ),
  );
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewBooksBloc>(
          create: (context) =>
              NewBooksBloc(homeRepo: HomeRepoImpl.instance)
                ..add(FetchNewBooksEvent()),
        ),
        BlocProvider<RelevantBooksBloc>(
          create: (context) =>
              RelevantBooksBloc(homeRepo: HomeRepoImpl.instance)
                ..add(FetchRelevantBooksEvent()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: (context, child) {
          return MediaQuery.withNoTextScaling(
            child: DevicePreview.appBuilder(context, child!),
          );
        },
        theme: AppTheme.theme,
        darkTheme: AppTheme.darkTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
