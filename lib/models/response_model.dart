import 'package:analyzer_app/models/port_model.dart';
import 'package:fl_chart/fl_chart.dart';

class ResponseModel {
  final List<PortModel> portList;
  final List<FlSpot> otdrList;
  final String fwVersion;

  ResponseModel({this.portList = const [], this.otdrList = const [], this.fwVersion = ""});
}
