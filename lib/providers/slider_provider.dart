import 'package:flutter/material.dart';

class SliderProvider extends ChangeNotifier {
  int _sliderIndex = 0;

  void changeSliderIndex(int i) {
    _sliderIndex = i;
    notifyListeners();
  }

  get getSliderIndex {
    return _sliderIndex;
  }
}
