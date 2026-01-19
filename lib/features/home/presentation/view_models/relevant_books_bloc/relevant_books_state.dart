part of 'relevant_books_bloc.dart';

@immutable
abstract class RelevantBooksState {}

class RelevantBooksLoadingState extends RelevantBooksState {}

class RelevantBooksSuccessState extends RelevantBooksState {
  final List<BookModel> books;

  RelevantBooksSuccessState({required this.books});
}

class RelevantBooksFailureState extends RelevantBooksState {
  final String message;

  RelevantBooksFailureState({required this.message});
}
