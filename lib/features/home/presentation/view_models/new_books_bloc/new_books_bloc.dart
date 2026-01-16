import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_books_event.dart';
part 'new_books_state.dart';

class NewBooksBloc extends Bloc<NewBooksEvent, NewBooksState> {
  NewBooksBloc() : super(NewBooksInitial()) {
    on<NewBooksEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
