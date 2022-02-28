import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final _locale = AppLocalizations.of(context);
    final _analyzerList = Provider.of<List<Analyzer>>(context);
    final TextTheme _textTheme = Theme.of(context).textTheme;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(_analyzerList[analyzerIndex].name),
              Text(_analyzerList[analyzerIndex].place, style: _textTheme.caption)
            ],
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [Tab(text: _locale!.data), Tab(text: _locale.edit)],
            indicatorColor: primaryColor,
            indicatorWeight: 3,
          ),
        ),
        body: TabBarView(
          children: [
            DataTab(
              analyzer: _analyzerList[analyzerIndex],
            ),
            EditTab(
              analyzer: _analyzerList[analyzerIndex],
            ),
          ],
        ),
      ),
    );
  }
}
