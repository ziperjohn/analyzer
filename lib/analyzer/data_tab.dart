import 'package:analyzer_app/analyzer/analyzer_ports.dart';
import 'package:analyzer_app/analyzer/otdr_chart.dart';
import 'package:analyzer_app/widgets/title_list.dart';
import 'package:flutter/material.dart';

class DataTab extends StatelessWidget {
  const DataTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleList(title: "Analyzer ports status"),
            const AnalyzerPorts(),
            const TitleList(title: "OTDR chart"),
            OTDRChart(),
          ],
        ),
      ),
    );
  }
}
