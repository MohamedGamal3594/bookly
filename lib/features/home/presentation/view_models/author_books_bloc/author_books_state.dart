part of 'author_books_bloc.dart';

@immutable
abstract class AuthorBooksState {}

class AuthorBooksInitial extends AuthorBooksState {}

class AuthorBooksLoadingState extends AuthorBooksState {}

class AuthorBooksSuccessState extends AuthorBooksState {
  final List<BookModel> books;

  AuthorBooksSuccessState({required this.books});
}

class AuthorBooksFailureState extends AuthorBooksState {
  final String message;

  AuthorBooksFailureState({required this.message});
}
