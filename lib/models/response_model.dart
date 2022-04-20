import 'package:analyzer_app/models/models.dart';
import 'package:fl_chart/fl_chart.dart';

class ResponseModel {
  final bool isKeyVerified;
  final String fwVersion;
  final List<PortModel> portList;
  final List<FlSpot> pointList;
  final List<EventModel> eventList;
  final InfoModel info;

  ResponseModel({
    required this.isKeyVerified,
    required this.fwVersion,
    required this.portList,
    required this.pointList,
    required this.eventList,
    required this.info,
  });
}
