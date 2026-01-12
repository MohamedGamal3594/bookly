import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/extensions/build_context_extension.dart';
import 'package:bookly/core/utils/router.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_cover.dart';
import 'package:bookly/features/home/presentation/views/widgets/rating_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/title_author_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BooksDetialsListView extends StatelessWidget {
  const BooksDetialsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: AppConstants.kPhoneBreakPoint,
        mainAxisSpacing: AppConstants.kPadding,
        crossAxisSpacing: AppConstants.kPadding,
        childAspectRatio: 2.2,
      ),
      itemBuilder: (context, index) => const _BookDetailsItem(),
    );
  }
}

class _BookDetailsItem extends StatelessWidget {
  const _BookDetailsItem();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: .opaque,
      onTap: () =>
          context.go('${AppRouter.homeView}${AppRouter.homeDetailsView}'),
      child: Row(
        children: [
          const BookCover(
            imageUrl:
                'https://m.media-amazon.com/images/I/71NAPiptyjL._AC_SL1500_.jpg',
          ),
          const SizedBox(width: AppConstants.kPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .spaceEvenly,
              children: [
                const TitleAuthorView(
                  title: 'Harry Potter And The Deathly Hallows',
                  author: 'J.K. Rowling',
                  isCollapsed: false,
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .baseline,
                  textBaseline: .alphabetic,
                  children: [
                    Text('19.99€', style: context.textTheme.labelLarge),
                    const RatingView(rating: 4.8, ratingsCount: 2390),
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
