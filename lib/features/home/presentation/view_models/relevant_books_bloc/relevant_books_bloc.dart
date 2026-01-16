import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'relevant_books_event.dart';
part 'relevant_books_state.dart';

class RelevantBooksBloc extends Bloc<RelevantBooksEvent, RelevantBooksState> {
  RelevantBooksBloc() : super(RelevantBooksInitial()) {
    on<RelevantBooksEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
