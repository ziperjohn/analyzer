import 'package:flutter/material.dart';

class ReauthenticationProvider extends ChangeNotifier {
  bool _isReauthenticated = false;

  bool get isReauthenticated => _isReauthenticated;

  void setIsReauthenticated(bool newValue) {
    _isReauthenticated = newValue;
    notifyListeners();
  }
}
