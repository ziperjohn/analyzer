import 'package:analyzer/widgets/main_chart.dart';
import 'package:flutter/material.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Chart"),
          centerTitle: true,
        ),
        body: const Center(child: MainChart()));
  }
}
