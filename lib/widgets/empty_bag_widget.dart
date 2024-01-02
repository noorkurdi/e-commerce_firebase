import 'package:firebase_test/core/utils/media_query_values.dart';
import 'package:firebase_test/widgets/subtitle_text.dart';
import 'package:firebase_test/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class EmptyBagWidget extends StatelessWidget {
  const EmptyBagWidget({
    super.key,
    required this.buttonText,
    required this.imagePath,
    required this.subtitle,
    required this.title,
  });
  final String imagePath, title, subtitle, buttonText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: context.width,
            height: context.height * .35,
          ),
          const SizedBox(
            height: 20,
          ),
          const TitleWidget(
            text: "Whoops",
            fontSize: 40,
            textColor: Colors.red,
          ),
          const SizedBox(
            height: 20,
          ),
          SubtitleTextWidget(
            text: title,
            maxLines: 2,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SubtitleTextWidget(
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              text: subtitle,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
              onPressed: () {},
              child: Text(buttonText))
        ],
      ),
    );
  }
}
