import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HeartBtnWidget extends StatelessWidget {
  const HeartBtnWidget({
    super.key,
    this.bkgColor = Colors.transparent,
    this.size = 20,
  });

  final Color bkgColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: bkgColor,
      child: IconButton(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {},
        icon: const Icon(
          IconlyLight.heart,
        ),
      ),
    );
  }
}
