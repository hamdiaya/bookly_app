import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class SimilarBooksState extends Equatable {
  @override
  List<Object?> get props => [];
}

class  SimilarBooksStateInitialState extends  SimilarBooksState {}

class  SimilarBooksStateLoadingState extends  SimilarBooksState{}

class  SimilarBooksStateFailureState extends SimilarBooksState {
  final String errMessage;

  SimilarBooksStateFailureState(this.errMessage);
}

class  SimilarBooksStateSuccesState extends SimilarBooksState {
  final List<BookModel> books;

 SimilarBooksStateSuccesState(this.books);
}