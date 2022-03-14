import 'package:flutter/material.dart';

class ChartProvider extends ChangeNotifier {
  bool _showAxisX = true;
  bool _showAxisY = false;
  bool _showGrid = false;
  bool _showDots = false;
  bool _showAreaUnderChart = true;

  bool get showAxisX => _showAxisX;
  bool get showAxisY => _showAxisY;
  bool get showGrid => _showGrid;
  bool get showDots => _showDots;
  bool get showAreaUnderChart => _showAreaUnderChart;

  void setShowAxisX(bool newValue) {
    _showAxisX = newValue;
    notifyListeners();
  }

  void setShowAxisY(bool newValue) {
    _showAxisY = newValue;
    notifyListeners();
  }

  void setShowGrid(bool newValue) {
    _showGrid = newValue;
    notifyListeners();
  }

  void setShowDots(bool newValue) {
    _showDots = newValue;
    notifyListeners();
  }

  void setShowAreaUnderChart(bool newValue) {
    _showAreaUnderChart = newValue;
    notifyListeners();
  }
}
