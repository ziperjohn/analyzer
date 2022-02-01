import 'package:analyzer/models/analyzer_model.dart';
import 'package:flutter/material.dart';

class AnalyzerProvider extends ChangeNotifier {
  List<Analyzer> analyzerList = [];

  Future<void> addAnalyzer(String name) async {
    Analyzer analyzer = Analyzer(id: analyzerList.length, name: name);
    analyzerList.add(analyzer);
    notifyListeners();
  }

  removeAnalyzer(int id) {
    analyzerList.removeAt(id);
    notifyListeners();
  }
}
