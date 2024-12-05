import 'package:flutter/material.dart';

class AnimationProvider with ChangeNotifier {
  bool _startAnimation = false;

  bool get startAnimation => _startAnimation;

  void triggerAnimation() {
    _startAnimation = true;
    notifyListeners();
  }

  void resetAnimation() {
    _startAnimation = false;
    // notifyListeners();
  }
}
