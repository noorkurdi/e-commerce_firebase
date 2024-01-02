import 'package:firebase_test/core/utils/app_constants.dart';
import 'package:firebase_test/widgets/subtitle_text.dart';
import 'package:firebase_test/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class AppFunctions {
  static Future<void> showErrorOrWarningDialog({
    required BuildContext context,
    required Function fct,
    required String subTitle,
    bool isError = true,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(
              height: 16,
            ),
            Image.asset(
              isError ? AppImages.userError : AppImages.userWarning,
              height: 60,
              width: 60,
            ),
            const SizedBox(
              height: 16,
            ),
            FittedBox(
              child: SubtitleTextWidget(
                text: subTitle,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: !isError,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const SubtitleTextWidget(
                      text: "cancel",
                      color: Colors.green,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const SubtitleTextWidget(
                    text: "Ok",
                    color: Colors.red,
                  ),
                )
              ],
            )
          ]),
        );
      },
    );
  }

  static Future<dynamic> pickImageDialog({
    required BuildContext context,
    required Function cameraFun,
    required Function galleryFun,
    required Function removeFun,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TitleWidget(text: "Choose option"),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    TextButton.icon(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        cameraFun();
                        if (Navigator.canPop(context)) Navigator.pop(context);
                      },
                      icon: const Icon(Icons.camera),
                      label: const Text("Camera"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton.icon(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        galleryFun();
                        if (Navigator.canPop(context)) Navigator.pop(context);
                      },
                      icon: const Icon(Icons.image),
                      label: const Text("Gallery"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton.icon(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        removeFun();
                        if (Navigator.canPop(context)) Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.red,
                      ),
                      label: const Text("Remove"),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class AppValidations {
  static String? Function(String?)? requiredValidation = (value) {
    if (value!.isEmpty || value == '') {
      return "This field is required";
    } else {
      return null;
    }
  };

  static String? Function(String?)? phoneNumberValidation = (value) {
    if (value!.isEmpty || value == '') {
      return "هذا الحقل مطلوب";
    } else if (!AppRegExp.phoneNumberRegex.hasMatch(value)) {
      return "الرقم غير صالح";
    } else {
      return null;
    }
  };

  static String? Function(String?)? passwordValidation = (value) {
    if (value!.isEmpty || value == '') {
      return "This field is required";
    } else if (value.length < 8) {
      return 'The password must be at least 8 characters long';
    } else if (!AppRegExp.passwordRegex.hasMatch(value)) {
      return "The password must contain a one letter and one number at least";
    } else {
      return null;
    }
  };

  static String? Function(String?)? emailValidation = (value) {
    if (value!.isEmpty || value == '') {
      return "This field is required";
    } else if (!AppRegExp.emailRegex.hasMatch(value)) {
      return "This email is not valid";
    } else {
      return null;
    }
  };

  static passwordConfirmationValidation(String? value, String confirmation) {
    if (value!.isEmpty || value == '') {
      return "This field is required";
    } else if (value != confirmation) {
      return "Doesn't confirm the password";
    } else {
      return null;
    }
  }
}
