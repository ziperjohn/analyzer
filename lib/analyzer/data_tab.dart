import 'package:analyzer_app/analyzer/analyzer_ports.dart';
import 'package:analyzer_app/widgets/primary_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:analyzer_app/analyzer/otdr_chart.dart';
import 'package:analyzer_app/widgets/title_list.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class DataTab extends StatefulWidget {
  const DataTab({Key? key}) : super(key: key);

  @override
  State<DataTab> createState() => _DataTabState();
}

class _DataTabState extends State<DataTab> {
  final _channel = WebSocketChannel.connect(
    Uri.parse('ws://localhost:8082'),
  );
  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? '${snapshot.data}' : '');
              },
            ),
            PrimaryButton(action: _sendMessage, text: "Send data")
            // TitleList(title: _locale!.analyzer_ports_status),
            // const AnalyzerPorts(),
            // TitleList(title: _locale.otdr_chart),
            // OTDRChart(),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    _channel.sink.add("Hello from flutter app!");
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }
}
