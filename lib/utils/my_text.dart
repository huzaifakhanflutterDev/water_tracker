import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyText extends StatelessWidget {
  String text;
  int size;
  FontWeight weight;
  Color color;
  TextAlign align;
  double spacing;
  String family;

  MyText({
    this.family = "Poppin",
    this.align = TextAlign.start,
    this.spacing = 0.0,
    required this.text,
    this.size = 13,
    this.weight = FontWeight.w600,
    this.color = const Color(0xff000000),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        letterSpacing: spacing,
        fontWeight: weight,
        fontSize: size.sp,
        color: color,
        fontFamily: family,
      ),
    );
  }
}
