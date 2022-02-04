import 'package:analyzer_app/analyzer/analyzer_ports.dart';
import 'package:analyzer_app/analyzer/otdr_chart.dart';
import 'package:flutter/material.dart';

class DataTab extends StatelessWidget {
  const DataTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const AnalyzerPorts(),
        OTDRChart(),
      ]),
    );
  }
}
