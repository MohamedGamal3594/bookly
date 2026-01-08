import 'package:bookly/core/utils/colors.dart';
import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/extensions/build_context_extension.dart';
import 'package:bookly/core/widgets/cover_container.dart';
import 'package:flutter/material.dart';

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
        childAspectRatio: 2.5,
      ),
      itemBuilder: (context, index) => const _BookDetailsItem(),
    );
  }
}

class _BookDetailsItem extends StatelessWidget {
  const _BookDetailsItem();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CoverView(
          url:
              'https://m.media-amazon.com/images/I/71NAPiptyjL._AC_SL1500_.jpg',
        ),
        const SizedBox(width: AppConstants.kPadding),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            mainAxisAlignment: .center,
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
              Flexible(
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .baseline,
                  textBaseline: .alphabetic,
                  children: [
                    Text('19.99 €', style: context.textTheme.bodyLarge),
                    Row(
                      mainAxisSize: .min,
                      crossAxisAlignment: .baseline,
                      textBaseline: .alphabetic,
                      children: [
                        Transform.translate(
                          offset: const Offset(0, 5),
                          child: const Icon(
                            Icons.star_rate_rounded,
                            color: AppColors.yellow,
                          ),
                        ),
                        Text(
                          '4.8',
                          style: context.textTheme.labelMedium?.copyWith(
                            fontWeight: .bold,
                          ),
                        ),
                        const SizedBox(width: 3),
                        Text('(2390)', style: context.textTheme.labelSmall),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
