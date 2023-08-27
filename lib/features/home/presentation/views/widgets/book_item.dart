import 'package:bookly_app/core/widgets/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: AspectRatio(
          aspectRatio: 1.3 / 2,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fill,
            placeholder: (context, url) {
              return const LoadingWidget();
            },
            errorWidget: (context, url, error) {
              return const Center(
                  child: Icon(
                Icons.error,
                color: Colors.white,
              ));
            },
          ),
        ),
      ),
    );
  }
}
