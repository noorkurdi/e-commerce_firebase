import 'package:flutter/material.dart';

class SubtitleTextWidget extends StatelessWidget {
  const SubtitleTextWidget({
    super.key,
    required this.text,
    this.fontSize = 18,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.textAlign,
    this.fontStyle,
    this.textDecoration,
    this.overflow = TextOverflow.ellipsis,
  });
  final String text;
  final int? maxLines;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? color;
  final TextOverflow overflow;
  final FontStyle? fontStyle;
  final TextDecoration? textDecoration;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle ,
        decoration: textDecoration,
      ),
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
