import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewestBooksState extends Equatable {
  @override
  List<Object?> get props => [];
}

class  NewestBooksInitialState extends  NewestBooksState {}

class  NewestBooksLoadingState extends  NewestBooksState {}

class  NewestBooksFailureState extends  NewestBooksState {
  final String errMessage;

  NewestBooksFailureState(this.errMessage);
}

class  NewestBooksSuccesState extends  NewestBooksState {
  final List<BookModel> books;

  NewestBooksSuccesState(this.books);
}