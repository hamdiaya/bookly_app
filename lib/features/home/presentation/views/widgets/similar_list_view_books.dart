import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/error_widget.dart';
import 'package:bookly_app/core/widgets/loading_widget.dart';
import 'package:bookly_app/features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_models/similar_books_cubit/similar_books_states.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarListViewBooks extends StatelessWidget {
  const SimilarListViewBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
      if (state is SimilarBooksStateFailureState) {
        return ErrWidget(
          errMessage: state.errMessage,
          height: MediaQuery.of(context).size.height * 0.17,
        );
      } else if (state is SimilarBooksStateSuccesState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.17,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pushReplacement(AppRouter.bookDetailsViewPath,
                          extra: state.books[index]);
                    },
                    child: BookItem(
                      imageUrl: state
                              .books[index].volumeInfo?.imageLinks?.thumbnail ??
                          'https://wallpapercave.com/wp/wp6474711.jpg',
                    ),
                  ),
                );
              },
            ),
          ),
        );
      } else {
        return const LoadingWidget();
      }
    });
  }
}
