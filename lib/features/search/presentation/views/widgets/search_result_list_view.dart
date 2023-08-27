import 'package:bookly_app/core/widgets/error_widget.dart';
import 'package:bookly_app/core/widgets/loading_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly_app/features/search/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/view_models/search_cubit/search_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(builder: (context, state) {
      if (state is FailureSearchState) {
        return ErrWidget(
            errMessage: state.errMessage,
            height: MediaQuery.of(context).size.height * 0.6);
      } else if (state is SuccesSearchState) {
        return ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: BestSellerItem(bookModel: state.books[index]),
              );
            });
      } else if (state is LoadingSearchState) {
        return const LoadingWidget();
      } else {
        return ErrWidget(
            errMessage: 'tap a subject to search books',
            height: MediaQuery.of(context).size.height * 0.6);
      }
    });
  }
}
