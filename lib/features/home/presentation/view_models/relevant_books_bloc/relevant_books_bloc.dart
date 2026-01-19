import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/result.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'relevant_books_event.dart';
part 'relevant_books_state.dart';

class RelevantBooksBloc extends Bloc<RelevantBooksEvent, RelevantBooksState> {
  final HomeRepo homeRepo;
  String searchText = '';
  RelevantBooksBloc({required this.homeRepo})
    : super(RelevantBooksLoadingState()) {
    on<FetchRelevantBooksEvent>((event, emit) async {
      final result = await homeRepo.fetchRelevantBooks(
        searchQuery: event.query,
      );
      switch (result) {
        case Success<List<BookModel>>(data: final books):
          emit(RelevantBooksSuccessState(books: books));
        case Failure(message: final message):
          emit(RelevantBooksFailureState(message: message));
      }
    }, transformer: _debounce(const Duration(milliseconds: 500)));
  }
  EventTransformer<T> _debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
