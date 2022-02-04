import 'package:analyzer_app/models/analyzer_model.dart';
import 'package:analyzer_app/widgets/analyzer_device.dart';
import 'package:analyzer_app/widgets/main_chart.dart';
import 'package:flutter/material.dart';

class AnalyzerScreen extends StatelessWidget {
  final Analyzer analyzer;

  const AnalyzerScreen({Key? key, required this.analyzer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(analyzer.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const AnalyzerDevice(),
            MainChart(),
          ],
        ),
      ),
    );
  }
}
