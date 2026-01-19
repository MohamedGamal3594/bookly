import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/extensions/build_context_extension.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/presentation/view_models/author_books_bloc/author_books_bloc.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_cover.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_horizontal_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_details_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/price_preview_buttons.dart';
import 'package:bookly/features/home/presentation/views/widgets/rating_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/title_author_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDetailsViewBody extends StatelessWidget {
  const HomeDetailsViewBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const HomeDetailsAppBar(),
        SliverPadding(
          padding: .symmetric(vertical: AppConstants.kPadding),
          sliver: SliverToBoxAdapter(
            child: Center(
              child: SizedBox(
                height: context.viewSize.longestSide * 0.4,
                child: BookCover(imageUrl: book.imageUrl),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: .only(
            right: context.safeRightPadding,
            left: context.safeLeftPadding,
          ),
          sliver: SliverList.list(
            children: [
              TitleAuthorView(title: book.title, author: book.author),
              Center(
                child: RatingView(rating: book.rating, votes: book.votes),
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: .only(bottom: context.safeBottomPadding),
          sliver: SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              spacing: AppConstants.kPadding,
              crossAxisAlignment: .start,
              children: [
                const Spacer(),
                Center(
                  child: PricePreviewButtons(
                    price: book.price,
                    buyLink: book.buyLink,
                    previewLink: book.previewLink,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: .only(
                    right: context.safeRightPadding,
                    left: context.safeLeftPadding,
                  ),
                  child: Text(
                    'You may also like',
                    style: context.textTheme.titleMedium,
                  ),
                ),
                SizedBox(
                  height: context.viewSize.longestSide * 0.23,
                  child: BlocBuilder<AuthorBooksBloc, AuthorBooksState>(
                    builder: (context, state) {
                      return switch (state) {
                        AuthorBooksSuccessState(books: final books) =>
                          BooksHorizontalListView(books: books),
                        AuthorBooksFailureState(message: final message) =>
                          Center(
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
