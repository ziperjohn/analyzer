import 'package:analyzer_app/models/models.dart';
import 'package:flutter/material.dart';

class AnalyzerPortsStatus extends StatelessWidget {
  final List<PortModel> portlist;

  const AnalyzerPortsStatus({Key? key, required this.portlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RowPort(portlist: portlist.sublist(0, 10)),
            RowPort(portlist: portlist.sublist(10, 20)),
          ],
        ),
      ),
    );
  }
}

class RowPort extends StatelessWidget {
  final List<PortModel> portlist;
  const RowPort({Key? key, required this.portlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [for (var port in portlist) Port(port: port)],
    );
  }
}

class Port extends StatelessWidget {
  final PortModel port;

  const Port({Key? key, required this.port}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          width: 20,
          color: port.color,
        ),
        const SizedBox(height: 3),
        Text("${port.id + 1}")
      ],
    );
  }
}
