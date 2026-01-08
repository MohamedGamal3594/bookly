import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/extensions/build_context_extension.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_horizontal_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const HomeAppBar(),
        SliverList.list(
          children: const [
            SizedBox(height: AppConstants.kPadding),
            BooksHorizontalListView(),
            SizedBox(height: AppConstants.kPadding),
          ],
        ),
        SliverPadding(
          padding: .only(
            left: context.safeLeftPadding,
            right: context.safeRightPadding,
          ),
          sliver: SliverToBoxAdapter(
            child: Text('Best Seller', style: context.textTheme.bodyLarge),
          ),
        ),
      ],
    );
  }
}
