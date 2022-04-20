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
      List<FlSpot> otdrList = [];

      var parsed = jsonDecode(response);

      var isKeyVerified = parsed["isKeyVerified"] as bool;
      var fwVersion = parsed["fwVersion"] as String;
      var portData = parsed["portList"] as List<dynamic>;
      var otdrData = parsed["otdrList"] as List<dynamic>;

      for (var item in portData) {
        portList.add(PortModel.fromJson(item));
      }

      for (var item in otdrData) {
        PointModel otdr = PointModel.fromJson(item);
        otdrList.add(FlSpot(otdr.distance.toDouble(), otdr.power.toDouble()));
      }

      ResponseModel data = ResponseModel(
        portList: portList,
        otdrList: otdrList,
        fwVersion: fwVersion,
        isKeyVerified: isKeyVerified,
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
