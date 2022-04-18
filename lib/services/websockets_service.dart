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
      List<PortModel> activePortList = [];

      var parsed = jsonDecode(response);

      var portData = parsed["portList"] as List<dynamic>;
      var otdrData = parsed["otdrList"] as List<dynamic>;
      var fwVersion = parsed["fwVersion"] as String;
      var isKeyVerified = parsed["isKeyVerified"] as bool;

      for (var item in portData) {
        portList.add(PortModel.fromJson(item));
      }

      for (var item in otdrData) {
        OTDRModel otdr = OTDRModel.fromJson(item);
        otdrList.add(FlSpot(otdr.distance.toDouble(), otdr.power.toDouble()));
      }

      for (var port in portList) {
        if (port.status == Status.ON || port.status == Status.ECHO) {
          activePortList.add(port);
        }
      }

      ResponseModel data = ResponseModel(
        portList: portList,
        activePortList: activePortList,
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
