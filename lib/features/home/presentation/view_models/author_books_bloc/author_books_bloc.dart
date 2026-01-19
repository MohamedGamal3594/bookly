import 'package:bookly/core/utils/result.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'author_books_event.dart';
part 'author_books_state.dart';

class AuthorBooksBloc extends Bloc<AuthorBooksEvent, AuthorBooksState> {
  final HomeRepo homeRepo;
  AuthorBooksBloc({required this.homeRepo}) : super(AuthorBooksLoadingState()) {
    on<FetchAuthorBooksEvent>((event, emit) async {
      final result = await homeRepo.fetchAuthorBooks(
        authorName: event.authorName,
      );
      switch (result) {
        case Success<List<BookModel>>(data: final books):
          emit(AuthorBooksSuccessState(books: books));
        case Failure(message: final message):
          emit(AuthorBooksFailureState(message: message));
      }
    });
  }
}
