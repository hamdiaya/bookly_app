import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class BooksActionButton extends StatelessWidget {
  const BooksActionButton(
      {super.key, required this.onTap, required this.bookModel});
  final Function() onTap;
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: const CustomButton(
            textColor: Colors.black,
            color: Colors.white,
            option: 'Free',
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: CustomButton(
            color: const Color.fromARGB(255, 255, 121, 112),
            option: getText(bookModel),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25)),
          ),
        ),
      ],
    );
  }

  String getText(BookModel book) {
    if (book.volumeInfo!.previewLink == null) {
      return 'not available';
    } else {
      return 'Preview';
    }
  }
}
