import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/loading_widget.dart';
import 'package:bookly_app/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_models/featured_books_cubit/featured_books_states.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/error_widget.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          if (state is FeaturedBooksSuccesState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.bookDetailsViewPath,
                            extra: state.books[index]);
                      },
                      child: BookItem(
                        imageUrl: state.books[index].volumeInfo?.imageLinks
                                ?.thumbnail ??
                            'https://wallpapercave.com/wp/wp6474711.jpg',
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is FeaturedBooksFailureState) {
            return ErrWidget(
              errMessage: state.errMessage,
              height: MediaQuery.of(context).size.height * 0.3,
            );
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}
