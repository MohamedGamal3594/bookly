import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/extensions/build_context_extension.dart';
import 'package:bookly/core/widgets/cover_container.dart';
import 'package:flutter/material.dart';

class BooksHorizontalListView extends StatelessWidget {
  const BooksHorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.viewSize.longestSide * 0.3,
      child: ListView.separated(
        padding: .only(
          left: context.safeLeftPadding,
          right: context.safeRightPadding,
        ),
        scrollDirection: .horizontal,
        itemCount: 10,
        separatorBuilder: (context, index) =>
            const SizedBox(width: AppConstants.kPadding),
        itemBuilder: (context, index) => const CoverContainer(
          url:
              'https://m.media-amazon.com/images/I/71NAPiptyjL._AC_SL1500_.jpg',
        ),
      ),
    );
  }
}
