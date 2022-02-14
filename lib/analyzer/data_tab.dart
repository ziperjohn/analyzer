import 'package:analyzer_app/analyzer/analyzer_ports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/analyzer/otdr_chart.dart';
import 'package:analyzer_app/widgets/title_list.dart';
import 'package:flutter/material.dart';

class DataTab extends StatelessWidget {
  const DataTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleList(title: _locale!.analyzer_ports_status),
            const AnalyzerPorts(),
            TitleList(title: _locale.otdr_chart),
            OTDRChart(),
          ],
        ),
      ),
    );
  }
}
