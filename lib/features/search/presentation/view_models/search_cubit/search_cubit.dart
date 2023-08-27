import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:bookly_app/features/search/presentation/view_models/search_cubit/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this.searchRepo) : super(InitialSearchState());
  final SearchRepo searchRepo;
  Future<void> searchBooks({required String subject}) async {
    emit(LoadingSearchState());
    var result = await searchRepo.searchBooks(subject: subject);
    result.fold((failure) {
      emit(FailureSearchState(failure.errMessage));
    }, (books) {
      emit(SuccesSearchState(books));
    });
  }
}
