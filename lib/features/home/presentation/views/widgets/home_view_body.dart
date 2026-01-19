import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/extensions/build_context_extension.dart';
import 'package:bookly/features/home/presentation/view_models/new_books_bloc/new_books_bloc.dart';
import 'package:bookly/features/home/presentation/view_models/relevant_books_bloc/relevant_books_bloc.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_details_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_horizontal_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        HomeAppBar(floating: innerBoxIsScrolled),
      ],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: .symmetric(vertical: AppConstants.kPadding),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: context.viewSize.longestSide * 0.3,
                child: BlocBuilder<NewBooksBloc, NewBooksState>(
                  builder: (context, state) {
                    return switch (state) {
                      NewBooksSuccessState(books: final books) =>
                        BooksHorizontalListView(books: books),
                      NewBooksFailureState(message: final message) => Center(
                        child: Text(
                          message,
                          style: context.textTheme.labelLarge,
                          textAlign: .center,
                        ),
                      ),
                      _ => const Center(child: CircularProgressIndicator()),
                    };
                  },
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: .only(
              left: context.safeLeftPadding,
              right: context.safeRightPadding,
              bottom: AppConstants.kPadding,
            ),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Most Relevant',
                style: context.textTheme.titleMedium,
              ),
            ),
          ),
          SliverPadding(
            padding: .only(
              left: context.safeLeftPadding,
              right: context.safeRightPadding,
              bottom: context.safeBottomPadding,
            ),
            sliver: BlocBuilder<RelevantBooksBloc, RelevantBooksState>(
              builder: (context, state) {
                return switch (state) {
                  RelevantBooksSuccessState(books: final books) =>
                    books.isNotEmpty
                        ? BooksDetailsListView(books: books)
                        : SliverFillRemaining(
                            hasScrollBody: false,
                            child: Center(
                              child: Text(
                                'No Results!',
                                style: context.textTheme.labelLarge,
                                textAlign: .center,
                              ),
                            ),
                          ),
                  RelevantBooksFailureState(message: final message) =>
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Text(
                          message,
                          style: context.textTheme.labelLarge,
                          textAlign: .center,
                        ),
                      ),
                    ),
                  _ => const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}
