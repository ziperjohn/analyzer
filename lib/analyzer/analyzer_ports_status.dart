import 'package:analyzer_app/models/models.dart';
import 'package:flutter/material.dart';

class AnalyzerPortsStatus extends StatelessWidget {
  final List<PortModel> portlist;

  const AnalyzerPortsStatus({Key? key, required this.portlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int firstRowLength = portlist.length > 10 ? 10 : portlist.length;
    int secondRowLength = portlist.length;

    return SizedBox(
      height: 150,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RowPort(portlist: portlist.sublist(0, firstRowLength)),
            if (portlist.length > 10) RowPort(portlist: portlist.sublist(10, secondRowLength)),
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
          height: 22,
          width: 22,
          decoration: BoxDecoration(
            color: port.color,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
        ),
        const SizedBox(height: 3),
        Text("${port.id + 1}")
      ],
    );
  }
}
