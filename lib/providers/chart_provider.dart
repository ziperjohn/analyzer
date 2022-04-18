import 'package:analyzer_app/services/services.dart';
import 'package:flutter/material.dart';

class ChartProvider extends ChangeNotifier {
  bool _showAxisX = UserSharedPreferences.showAxisX;
  bool _showAxisY = UserSharedPreferences.showAxisY;
  bool _showGrid = UserSharedPreferences.showGrid;
  bool _showDots = UserSharedPreferences.showDots;
  bool _showAreaUnderChart = UserSharedPreferences.showAreaUnderChart;

  bool get showAxisX => _showAxisX;
  bool get showAxisY => _showAxisY;
  bool get showGrid => _showGrid;
  bool get showDots => _showDots;
  bool get showAreaUnderChart => _showAreaUnderChart;

  void setShowAxisX(bool newValue) {
    _showAxisX = newValue;
    UserSharedPreferences.showAxisX = newValue;
    notifyListeners();
  }

  void setShowAxisY(bool newValue) {
    _showAxisY = newValue;
    UserSharedPreferences.showAxisY = newValue;
    notifyListeners();
  }

  void setShowGrid(bool newValue) {
    _showGrid = newValue;
    UserSharedPreferences.showGrid = newValue;
    notifyListeners();
  }

  void setShowDots(bool newValue) {
    _showDots = newValue;
    UserSharedPreferences.showDots = newValue;
    notifyListeners();
  }

  void setShowAreaUnderChart(bool newValue) {
    _showAreaUnderChart = newValue;
    UserSharedPreferences.showAreaUnderChart = newValue;
    notifyListeners();
  }
}
