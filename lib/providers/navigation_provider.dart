import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _screenIndex = 0;

  int get screenIndex => _screenIndex;

  void setScreenIndex(int newIndex) {
    _screenIndex = newIndex;
    notifyListeners();
  }
}
