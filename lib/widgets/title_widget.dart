import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(
      {super.key,
      required this.text,
      this.fontSize = 20,
      this.textColor,
      this.maxLines,
      this.softWrap,
      this.overflow = TextOverflow.ellipsis});
  final String text;
  final double fontSize;
  final Color? textColor;
  final TextOverflow overflow;
  final bool? softWrap;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
      softWrap: softWrap,
    );
  }
}
