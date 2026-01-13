import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/extensions/build_context_extension.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_details_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_horizontal_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (_, innerBoxIsScrolled) => [
        HomeAppBar(floating: innerBoxIsScrolled),
      ],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: .symmetric(vertical: AppConstants.kPadding),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: context.viewSize.longestSide * 0.3,
                child: BooksHorizontalListView(),
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
              child: Text('Best Seller', style: context.textTheme.titleMedium),
            ),
          ),
          SliverPadding(
            padding: .only(
              left: context.safeLeftPadding,
              right: context.safeRightPadding,
              bottom: context.safeBottomPadding,
            ),
            sliver: const BooksDetialsListView(),
          ),
        ],
      ),
    );
  }
}
