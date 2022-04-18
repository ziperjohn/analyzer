import 'package:analyzer_app/models/models.dart';
import 'package:fl_chart/fl_chart.dart';

class ResponseModel {
  final List<PortModel> portList;
  final List<PortModel> activePortList;
  final List<FlSpot> otdrList;
  final String fwVersion;
  final bool isKeyVerified;

  ResponseModel({
    this.portList = const [],
    this.activePortList = const [],
    this.otdrList = const [],
    this.fwVersion = "",
    this.isKeyVerified = false,
  });
}
