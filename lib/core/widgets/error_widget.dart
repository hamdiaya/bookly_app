import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ErrWidget extends StatelessWidget {
  const ErrWidget({super.key, required this.errMessage, required this.height});
  final String errMessage;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.grey),
        child: Center(
            child: Text(
          errMessage,
          style: Styles.textStyle20.copyWith(color: Colors.black),
        )));
  }
}
