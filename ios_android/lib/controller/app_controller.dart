import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();
  bool isDarkBrightness = false;

  changeBrightness() {
    isDarkBrightness = !isDarkBrightness;
    notifyListeners();
  }
}
