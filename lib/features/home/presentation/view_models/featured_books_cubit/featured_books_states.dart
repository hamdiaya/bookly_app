import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class FeaturedBooksState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FeaturedBooksInitialState extends FeaturedBooksState {}

class FeaturedBooksLoadingState extends FeaturedBooksState {}

class FeaturedBooksFailureState extends FeaturedBooksState {
  final String errMessage;

  FeaturedBooksFailureState(this.errMessage);
}

class FeaturedBooksSuccesState extends FeaturedBooksState {
  final List<BookModel> books;

  FeaturedBooksSuccesState(this.books);
}
