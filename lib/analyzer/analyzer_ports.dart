import 'package:analyzer_app/models/port_model.dart';
import 'package:analyzer_app/theme/colors.dart';
import 'package:flutter/material.dart';

class AnalyzerPorts extends StatelessWidget {
  final List<PortModel> portlist;

  const AnalyzerPorts({Key? key, required this.portlist}) : super(key: key);

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
    Map<String, Color> colorMap = {
      "ERROR": redColor,
      "ECHO": orangeColor,
      "ON": greenColor,
      "OFF": blackColor,
    };

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var port in portlist)
          Port(
            id: port.id + 1,
            color: colorMap[port.state] ?? blackColor,
          )
      ],
    );
  }
}

class Port extends StatelessWidget {
  final int id;
  final Color color;
  const Port({Key? key, required this.id, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          width: 20,
          color: color,
        ),
        const SizedBox(height: 3),
        Text(id.toString())
      ],
    );
  }
}
