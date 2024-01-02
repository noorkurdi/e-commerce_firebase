import 'package:firebase_test/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.imagePath,
    required this.onTab,
    required this.text,
  });
  final String text, imagePath;
  final void Function() onTab;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTab,
      title: SubtitleTextWidget(text: text),
      trailing: const Icon(
        IconlyLight.arrowRight2,
      ),
      leading: Image.asset(
        imagePath,
        height: 30,
      ),
    );
  }
}
