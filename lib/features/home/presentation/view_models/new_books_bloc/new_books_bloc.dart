import 'package:bookly/core/utils/result.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_books_event.dart';
part 'new_books_state.dart';

class NewBooksBloc extends Bloc<NewBooksEvent, NewBooksState> {
  final HomeRepo homeRepo;
  NewBooksBloc({required this.homeRepo}) : super(NewBooksLoadingState()) {
    on<FetchNewBooksEvent>((event, emit) async {
      final result = await homeRepo.fetchNewBooks();
      switch (result) {
        case Success<List<BookModel>>(data: final books):
          emit(NewBooksSuccessState(books: books));
        case Failure(message: final message):
          emit(NewBooksFailureState(message: message));
      }
    });
  }
}
