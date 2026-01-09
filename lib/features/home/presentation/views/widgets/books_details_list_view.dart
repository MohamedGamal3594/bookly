import 'package:bookly/core/utils/colors.dart';
import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/extensions/build_context_extension.dart';
import 'package:bookly/core/utils/router.dart';
import 'package:bookly/core/widgets/cover_container.dart';
import 'package:bookly/features/home/presentation/views/widgets/rating_view.dart';
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
          const CoverView(
            url:
                'https://m.media-amazon.com/images/I/71NAPiptyjL._AC_SL1500_.jpg',
          ),
          const SizedBox(width: AppConstants.kPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .spaceEvenly,
              children: [
                Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Harry Potter And The Deathly Hallows',
                      style: context.textTheme.labelLarge,
                      maxLines: 2,
                      overflow: .ellipsis,
                    ),
                    Text(
                      'J.K. Rowling',
                      style: context.textTheme.labelMedium?.copyWith(
                        color: AppColors.grey,
                      ),
                      maxLines: 2,
                      overflow: .ellipsis,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .baseline,
                  textBaseline: .alphabetic,
                  children: [
                    Text('19.99€', style: context.textTheme.bodyLarge),
                    const RatingView(),
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
