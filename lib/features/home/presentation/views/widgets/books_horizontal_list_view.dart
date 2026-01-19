import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/extensions/build_context_extension.dart';
import 'package:bookly/core/utils/router.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BooksHorizontalListView extends StatelessWidget {
  const BooksHorizontalListView({super.key, required this.books});
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: .only(
        left: context.safeLeftPadding,
        right: context.safeRightPadding,
      ),
      scrollDirection: .horizontal,
      itemCount: books.length,
      separatorBuilder: (context, index) =>
          const SizedBox(width: AppConstants.kPadding),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => context.go(
          '${AppRouter.homeView}${AppRouter.homeDetailsView}',
          extra: books[index],
        ),
        child: BookCover(imageUrl: books[index].imageUrl),
      ),
    );
  }
}
