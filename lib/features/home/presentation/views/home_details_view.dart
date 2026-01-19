import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_details_view_body.dart';
import 'package:flutter/material.dart';

class HomeDetailsView extends StatelessWidget {
  const HomeDetailsView({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeDetailsViewBody(book: book));
  }
}
