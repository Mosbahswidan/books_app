import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final void Function() onPressed;
  final BorderRadius? borderRadius;
  final double? textSize;
  const CustomButton(
      {super.key,
      required this.text,
      this.textColor = Colors.black,
      required this.onPressed,
      this.backgroundColor = Colors.white,
      this.borderRadius,
      this.textSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(15),
            )),
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: textSize),
        ),
      ),
    );
  }
}
