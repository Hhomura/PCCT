import 'package:flutter/material.dart';

class HomePageController extends ChangeNotifier {

  static HomePageController instance = HomePageController();
  bool isDarkBrightness = false;

  changeBrightness(){
    isDarkBrightness = !isDarkBrightness;
    notifyListeners();
  }
}