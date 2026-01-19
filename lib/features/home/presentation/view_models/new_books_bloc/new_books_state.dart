part of 'new_books_bloc.dart';

@immutable
abstract class NewBooksState {}

class NewBooksLoadingState extends NewBooksState {}

class NewBooksSuccessState extends NewBooksState {
  final List<BookModel> books;

  NewBooksSuccessState({required this.books});
}

class NewBooksFailureState extends NewBooksState {
  final String message;

  NewBooksFailureState({required this.message});
}
