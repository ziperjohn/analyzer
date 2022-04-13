import 'package:analyzer_app/analyzer/analyzer_ports.dart';
import 'package:analyzer_app/localization/flushbar_localization.dart';
import 'package:analyzer_app/models/analyzer_model.dart';
import 'package:analyzer_app/models/response_model.dart';
import 'package:analyzer_app/services/websockets_service.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:analyzer_app/widgets/big_spacer.dart';
import 'package:analyzer_app/widgets/loading_indicator.dart';
import 'package:analyzer_app/widgets/pulsing_icon.dart';
import 'package:analyzer_app/widgets/small_spacer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/analyzer/otdr_chart.dart';
import 'package:analyzer_app/widgets/title_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DataTab extends StatelessWidget {
  final AnalyzerModel analyzer;
  const DataTab({Key? key, required this.analyzer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);

    if (analyzer.ipAddress == "" || analyzer.port == "") {
      return const WebSocketErrorWidget(error: "ip_port_not_defined");
    } else {
      return StreamBuilder<ResponseModel>(
        stream: WebSocketService(ipAddress: analyzer.ipAddress, port: analyzer.port, key: analyzer.key)
            .webSocketStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isKeyVerified) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleList(title: _locale!.analyzer_ports_status),
                    AnalyzerPorts(portlist: snapshot.data!.portList),
                    TitleList(title: _locale.otdr_chart),
                    OTDRChart(otdrList: snapshot.data!.otdrList),
                    const SmallSpacer(),
                    Center(
                        child: Text("${_locale.fw_version}: ${snapshot.data!.fwVersion}",
                            style: Theme.of(context).textTheme.caption)),
                    const BigSpacer(),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasData && !snapshot.data!.isKeyVerified) {
            return const WrongAnalyzerKeyWidget();
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

class WrongAnalyzerKeyWidget extends StatelessWidget {
  const WrongAnalyzerKeyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);
    final _textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const PulsingIcon(
            icon: FontAwesomeIcons.key,
            color: redColor,
          ),
          Text(_locale!.incorrect_key),
          Text(
            _locale.incorect_key_help,
            style: _textTheme.caption,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class WebSocketErrorWidget extends StatelessWidget {
  final String error;
  const WebSocketErrorWidget({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);
    final _errorLocalization = FlushbarLocalization();
    final _textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const PulsingIcon(
            icon: FontAwesomeIcons.exclamation,
            color: redColor,
          ),
          Text(
            _errorLocalization.parseErrorCodeToLocaleString(
                _locale!, _errorLocalization.findSubstringInErrorMessage(error)),
            textAlign: TextAlign.center,
          ),
          Text(
            error != "ip_port_not_defined" ? error : "",
            style: _textTheme.caption,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
