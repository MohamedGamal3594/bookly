part of 'relevant_books_bloc.dart';

@immutable
abstract class RelevantBooksEvent {}

class FetchRelevantBooksEvent extends RelevantBooksEvent {
  final String query;

  FetchRelevantBooksEvent({this.query = AppConstants.defaultQuery});
}
