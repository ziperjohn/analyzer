import 'package:analyzer_app/analyzer/analyzer_ports.dart';
import 'package:analyzer_app/models/analyzer_model.dart';
import 'package:analyzer_app/models/port_model.dart';
import 'package:analyzer_app/services/websockets_service.dart';
import 'package:analyzer_app/widgets/loading_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/analyzer/otdr_chart.dart';
import 'package:analyzer_app/widgets/title_list.dart';
import 'package:flutter/material.dart';

class DataTab extends StatelessWidget {
  final Analyzer analyzer;
  const DataTab({Key? key, required this.analyzer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);

    if (analyzer.ipAddress == "" && analyzer.port == "") {
      return Center(child: Text(_locale!.ip_port_not_defined));
    } else {
      return StreamBuilder<List<PortModel>>(
        stream: WebSocketService(ipAddress: analyzer.ipAddress, port: analyzer.port).portListStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleList(title: _locale!.analyzer_ports_status),
                    AnalyzerPorts(portlist: snapshot.data!),
                    TitleList(title: _locale.otdr_chart),
                    OTDRChart(),
                  ],
                ),
              ),
            );
          } else {
            return const LoadingIndicator();
          }
        },
      );
    }
  }
}
