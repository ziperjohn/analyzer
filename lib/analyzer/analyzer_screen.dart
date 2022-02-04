import 'package:analyzer_app/analyzer/data_tab.dart';
import 'package:analyzer_app/analyzer/edit_tab.dart';
import 'package:analyzer_app/models/analyzer_model.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:flutter/material.dart';

class AnalyzerScreen extends StatelessWidget {
  final Analyzer analyzer;

  const AnalyzerScreen({Key? key, required this.analyzer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(analyzer.name),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [Tab(text: "Data"), Tab(text: "Edit")],
            indicatorColor: primaryColor,
            indicatorWeight: 3,
          ),
        ),
        body: TabBarView(
          children: [
            DataTab(),
            EditTab(
              analyzer: analyzer,
            ),
          ],
        ),
      ),
    );
  }
}
