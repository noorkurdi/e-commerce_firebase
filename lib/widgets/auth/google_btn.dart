import 'package:firebase_test/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class GoogleBtn extends StatelessWidget {
  const GoogleBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          elevation: 2,
          foregroundColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      onPressed: () {},
      icon: const Icon(
        Ionicons.logo_google,
        color: Colors.red,
      ),
      label: const SubtitleTextWidget(
        fontSize: 14,
        text: "Sign in with google",
      ),
    );
  }
}
