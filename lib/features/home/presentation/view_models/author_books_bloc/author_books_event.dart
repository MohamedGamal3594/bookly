part of 'author_books_bloc.dart';

@immutable
abstract class AuthorBooksEvent {}

class FetchAuthorBooksEvent extends AuthorBooksEvent {
  final String authorName;

  FetchAuthorBooksEvent({required this.authorName});
}
