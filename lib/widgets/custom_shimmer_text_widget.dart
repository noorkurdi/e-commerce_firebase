import 'package:firebase_test/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerTextWidget extends StatelessWidget {
  const CustomShimmerTextWidget({super.key, required this.text, this.fontSize});
  final String text;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 10),
      baseColor: Colors.purple,
      highlightColor: Colors.red,
      child: TitleWidget(
        text: text,
        fontSize: fontSize ?? 20,
      ),
    );
  }
}
