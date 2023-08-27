import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class SearchStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialSearchState extends SearchStates {}

class LoadingSearchState extends SearchStates {}

class FailureSearchState extends SearchStates {
  final String errMessage;

  FailureSearchState(this.errMessage);
}

class SuccesSearchState extends SearchStates {
  final List<BookModel> books;

  SuccesSearchState(this.books);
}
