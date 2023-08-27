import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.option,
    required this.color,
    required this.borderRadius,
    this.textColor,
  });
  final String option;
  final Color color;
  final Color? textColor;
  final BorderRadiusGeometry borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(color: color, borderRadius: borderRadius),
      child: Center(
          child: Text(
        option,
        style: Styles.textStyle14.copyWith(color: textColor ?? Colors.white),
      )),
    );
  }
}
