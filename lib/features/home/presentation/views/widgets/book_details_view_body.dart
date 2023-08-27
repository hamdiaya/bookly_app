import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_view_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_item.dart';

import 'package:bookly_app/features/home/presentation/views/widgets/books_action_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_list_view_books.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Column(
            children: [
              const BookDetailsViewAppBar(),
              BookItem(
                imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                    'https://wallpapercave.com/wp/wp6474711.jpg',
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                bookModel.volumeInfo?.title ?? 'book title unknown',
                textAlign: TextAlign.center,
                style: Styles.textStyle20,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                bookModel.volumeInfo!.authors![0],
                style: Styles.textStyle10.copyWith(fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                '(${bookModel.volumeInfo?.pageCount}pages)',
                style: Styles.textStyle10,
              ),
              const SizedBox(
                height: 37,
              ),
              BooksActionButton(
                bookModel:bookModel,
                onTap: () async {
                  Uri url = Uri.parse(bookModel.volumeInfo!.previewLink!);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
              ),
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'you can also like :',
                    style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const SimilarListViewBooks(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
