import 'package:firebase_test/core/utils/app_constants.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  bool _isPasswordLocked = true;

  Future<void> loginEvent() async {
    if (AppKeys.loginKey.currentState!.validate()) {
      print("object");
    }
  }

  void showPasswordEvent(bool password) {
    _isPasswordLocked = !password;
    print(_isPasswordLocked);
    notifyListeners();
  }

  bool get isPasswordLocked {
    return _isPasswordLocked;
  }
}
