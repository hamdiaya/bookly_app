import 'package:bookly_app/core/widgets/loading_widget.dart';
import 'package:bookly_app/features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_models/newest_books_cubit/newest_books_states.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/error_widget.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<NewestBooksCubit, NewestBooksState>(
            builder: (context, state) {
          if (state is NewestBooksSuccesState) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: state.books.length,
                physics: const NeverScrollableScrollPhysics(),
                
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: BestSellerItem(
                     bookModel: state.books[index],),
                  );
                });
          } else if (state is NewestBooksFailureState) {
            return ErrWidget(errMessage:state.errMessage,height: MediaQuery.of(context).size.height * 0.4,);
          } else {
            return const Center(child:  LoadingWidget());
          }
        }));
  }
}
