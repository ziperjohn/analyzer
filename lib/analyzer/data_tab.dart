import 'package:analyzer_app/analyzer/analyzer_ports.dart';
import 'package:analyzer_app/localization/flushbar_localization.dart';
import 'package:analyzer_app/models/analyzer_model.dart';
import 'package:analyzer_app/models/response_model.dart';
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
      return StreamBuilder<ResponseModel>(
        stream: WebSocketService(ipAddress: analyzer.ipAddress, port: analyzer.port).webSocketStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleList(title: _locale!.analyzer_ports_status),
                    AnalyzerPorts(portlist: snapshot.data!.portList),
                    TitleList(title: _locale.otdr_chart),
                    OTDRChart(otdrList: snapshot.data!.otdrList),
                    const SizedBox(height: 20),
                    Center(
                        child: Text("${_locale.fw_version}: ${snapshot.data!.fwVersion}",
                            style: Theme.of(context).textTheme.caption)),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return WebSocketErrorWidget(error: snapshot.error.toString());
          } else {
            return const LoadingIndicator();
          }
        },
      );
    }
  }
}

class WebSocketErrorWidget extends StatelessWidget {
  final String error;
  const WebSocketErrorWidget({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final errorLocalization = FlushbarLocalization();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Center(
        child: Text(
          errorLocalization.parseErrorCodeToLocaleString(
              locale!, errorLocalization.findSubstringInErrorMessage(error)),
        ),
      ),
    );
  }
}
