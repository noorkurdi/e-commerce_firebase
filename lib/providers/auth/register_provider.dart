import 'package:firebase_test/core/enums/image_picker_enum.dart';
import 'package:firebase_test/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwrodConfirmatoinController =
      TextEditingController();

  FocusNode usernameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode passwordConfirmationFocusNode = FocusNode();

  bool _isPasswordLocked = true;
  bool _isPasswordConfirmationLocked = true;

  ////////METHODS/////////
  Future<void> registerEvent() async {
    if (AppKeys.registerKey.currentState!.validate()) {}
  }

  void showPasswordEvent(bool password) {
    _isPasswordLocked = !password;
    notifyListeners();
  }

  void showPasswordConfirmationEvent(bool password) {
    _isPasswordConfirmationLocked = !password;
    notifyListeners();
  }

  bool get isPasswordLocked => _isPasswordLocked;

  bool get isPasswordConfirmationLocked => _isPasswordConfirmationLocked;
}
