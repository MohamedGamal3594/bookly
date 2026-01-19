import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/extensions/build_context_extension.dart';
import 'package:bookly/core/utils/router.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_cover.dart';
import 'package:bookly/features/home/presentation/views/widgets/rating_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/title_author_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BooksDetailsListView extends StatelessWidget {
  const BooksDetailsListView({super.key, required this.books});
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: books.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: AppConstants.kPhoneBreakPoint,
        mainAxisSpacing: AppConstants.kPadding,
        crossAxisSpacing: AppConstants.kPadding,
        childAspectRatio: 2.2,
      ),
      itemBuilder: (context, index) => _BookDetailsItem(book: books[index]),
    );
  }
}

class _BookDetailsItem extends StatelessWidget {
  const _BookDetailsItem({required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: .opaque,
      onTap: () => context.go(
        '${AppRouter.homeView}${AppRouter.homeDetailsView}',
        extra: book,
      ),
      child: Row(
        children: [
          BookCover(imageUrl: book.imageUrl),
          const SizedBox(width: AppConstants.kPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .spaceEvenly,
              children: [
                TitleAuthorView(
                  title: book.title,
                  author: book.author,
                  isCollapsed: false,
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .baseline,
                  textBaseline: .alphabetic,
                  children: [
                    Text(
                      book.price == null
                          ? book.buyLink == null
                                ? 'Not Available'
                                : 'Free'
                          : '${book.price}€',
                      style: context.textTheme.labelLarge,
                    ),
                    RatingView(rating: book.rating, votes: book.votes),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
