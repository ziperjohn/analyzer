import 'package:analyzer_app/analyzer/data_tab.dart';
import 'package:analyzer_app/analyzer/edit_tab.dart';
import 'package:analyzer_app/models/analyzer_model.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnalyzerScreen extends StatelessWidget {
  final int analyzerIndex;

  const AnalyzerScreen({Key? key, required this.analyzerIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final analyzerList = Provider.of<List<Analyzer>>(context);
    final TextTheme _textTheme = Theme.of(context).textTheme;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(analyzerList[analyzerIndex].name),
              Text(analyzerList[analyzerIndex].place, style: _textTheme.caption)
            ],
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [Tab(text: "Data"), Tab(text: "Edit")],
            indicatorColor: primaryColor,
            indicatorWeight: 3,
          ),
        ),
        body: TabBarView(
          children: [
            const DataTab(),
            EditTab(
              analyzer: analyzerList[analyzerIndex],
            ),
          ],
        ),
      ),
    );
  }
}
