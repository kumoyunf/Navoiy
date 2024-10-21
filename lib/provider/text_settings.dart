import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class TextSettings extends ChangeNotifier {
  double _fontSize = 18.0;
  String _fontFamily = 'Arial';
  Color _textColor = light;
  Color _textBackColor = background;

  static const double minFontSize = 8.0;
  static const double maxFontSize = 42.0;

  double get fontSize => _fontSize;
  String get fontFamily => _fontFamily;
  Color get textColor => _textColor;
  Color get textBackColor => _textBackColor;

  void increaseFontSize({double size = 2}) {
    if (_fontSize < maxFontSize) {
      _fontSize += size;
      notifyListeners();
    }
  }

  void decreaseFontSize({double size = 2}) {
    if (_fontSize > minFontSize) {
      _fontSize -= size;
      notifyListeners();
    }
  }

  void changeFontFamily(String fontFamily) {
    _fontFamily = fontFamily;
    notifyListeners();
  }

  void changeTextColor(Color color) {
    _textColor = color;
    notifyListeners();
  }

  void changeTextBackColor(Color color) {
    _textBackColor = color;
    notifyListeners();
  }
}
