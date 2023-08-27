import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetailsViewPath,extra: bookModel);
      },
      child: SizedBox(
        height: 110,
        child: Row(
          children: [
            SizedBox(
              height: 110,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: AspectRatio(
                    aspectRatio: 1.4 / 2,
                    child: CachedNetworkImage(
                        imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                            'https://wallpapercave.com/wp/wp6474711.jpg',
                            fit: BoxFit.fill,)),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Text(
                      bookModel.volumeInfo?.title ?? 'book title',
                      style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    bookModel.volumeInfo!.authors![0],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle14,
                      ),
                      Text('(${bookModel.volumeInfo?.pageCount}pages)',style: Styles.textStyle10,)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
