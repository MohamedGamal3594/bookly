import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/extensions/build_context_extension.dart';
import 'package:bookly/core/widgets/cover_container.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_horizontal_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_details_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/price_preview_buttons.dart';
import 'package:bookly/features/home/presentation/views/widgets/rating_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/title_author_view.dart';
import 'package:flutter/material.dart';

class HomeDetailsViewBody extends StatelessWidget {
  const HomeDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const HomeDetailsAppBar(),
        SliverPadding(
          padding: .symmetric(
            vertical: AppConstants.kPadding,
            horizontal: context.viewSize.width < AppConstants.kPhoneBreakPoint
                ? context.viewSize.width * 0.28
                : context.viewSize.width * 0.3,
          ),
          sliver: SliverToBoxAdapter(
            child: CoverView(
              imageUrl:
                  'https://m.media-amazon.com/images/I/71NAPiptyjL._AC_SL1500_.jpg',
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
              const TitleAuthorView(
                title: 'Harry Potter And The Deathly Hallows',
                author: 'J.K. Rowling',
              ),
              const Center(child: RatingView(rating: 4.8, ratingsCount: 2390)),
              Padding(
                padding: const .symmetric(vertical: AppConstants.kPadding * 2),
                child: Center(child: PricePreviewButtons(price: 19.99)),
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
                Padding(
                  padding: .only(
                    right: context.safeRightPadding,
                    left: context.safeLeftPadding,
                  ),
                  child: Text(
                    'You can also like',
                    style: context.textTheme.bodyLarge,
                  ),
                ),
                SizedBox(
                  height: context.viewSize.longestSide * 0.23,
                  child: BooksHorizontalListView(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
