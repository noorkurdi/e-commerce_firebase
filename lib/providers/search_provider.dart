import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  TextEditingController searchBarController = TextEditingController();

  void isSearchEmpty(val) {
    if (searchBarController.text.isNotEmpty) {
      notifyListeners();
    } else {
      notifyListeners();
    }
  }
}
