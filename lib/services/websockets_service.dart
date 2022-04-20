import 'package:analyzer_app/models/models.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class WebSocketService {
  final String ipAddress;
  final String port;
  final String key;
  late WebSocketChannel webSocketChannel;

  WebSocketService({required this.ipAddress, required this.port, required this.key});

  Stream<ResponseModel> webSocketStream() {
    createWebSocketChannel();

    return webSocketChannel.stream.map((response) {
      List<PortModel> portList = [];
      List<FlSpot> pointList = [];
      List<EventModel> eventList = [];

      var parsed = jsonDecode(response);

      var isKeyVerified = parsed["isKeyVerified"] as bool;
      var fwVersion = parsed["fwVersion"] as String;
      var portData = parsed["portList"] as List<dynamic>;
      var pointData = parsed["pointList"] as List<dynamic>;
      var eventData = parsed["eventList"] as List<dynamic>;
      var info = parsed["info"] as Map<String, dynamic>;

      for (var port in portData) {
        portList.add(PortModel.fromJson(port));
      }

      for (var event in eventData) {
        eventList.add(EventModel.fromJson(event));
      }

      for (var point in pointData) {
        PointModel otdr = PointModel.fromJson(point);
        pointList.add(FlSpot(otdr.distance.toDouble(), otdr.power.toDouble()));
      }

      ResponseModel data = ResponseModel(
        isKeyVerified: isKeyVerified,
        fwVersion: fwVersion,
        info: info.isEmpty ? InfoModel() : InfoModel.fromJson(info),
        portList: portList,
        pointList: pointList,
        eventList: eventList,
      );

      return data;
    });
  }

  void createWebSocketChannel() {
    webSocketChannel = WebSocketChannel.connect(Uri.parse("ws://$ipAddress:$port"));
    sendData(jsonEncode({"key": key, "selectedPort": null}));
  }

  void closeWebSocketChannel() {
    webSocketChannel.sink.close();
  }

  void sendData(String data) {
    webSocketChannel.sink.add(data);
  }
}
