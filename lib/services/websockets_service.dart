import 'package:analyzer_app/models/otdr_model.dart';
import 'package:analyzer_app/models/port_model.dart';
import 'package:analyzer_app/models/response_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class WebSocketService {
  final String ipAddress;
  final String port;
  late WebSocketChannel webSocketChannel;

  WebSocketService({this.ipAddress = "", this.port = ""});

  void createConnection() {
    webSocketChannel = WebSocketChannel.connect(Uri.parse("ws://$ipAddress:$port"));
  }

  Stream<ResponseModel> portListStream() {
    createConnection();

    return webSocketChannel.stream.map((response) {
      List<PortModel> portList = [];
      List<FlSpot> otdrList = [];

      var parsed = jsonDecode(response);

      var portData = parsed["portList"] as List<dynamic>;
      var otdrData = parsed["otdrList"] as List<dynamic>;
      var fwVersion = parsed["fwVersion"] as String;

      for (var item in portData) {
        portList.add(PortModel.fromJson(item));
      }

      for (var item in otdrData) {
        OTDRModel otdr = OTDRModel.fromJson(item);
        otdrList.add(FlSpot(otdr.distance.toDouble(), otdr.power));
      }

      ResponseModel data = ResponseModel(portList: portList, otdrList: otdrList, fwVersion: fwVersion);

      return data;
    });
  }

//  Stream<List<PortModel>> portListStream() {
//     createConnection();

//     return webSocketChannel.stream.map((response) {
//       List<PortModel> portList = [];

//       var parsed = jsonDecode(response);
//       var list = parsed["portList"] as List<dynamic>;

//       for (var item in list) {
//         portList.add(PortModel.fromJson(item));
//       }

//       return portList;
//     });
//   }

  void closeStream() {
    webSocketChannel.sink.close();
  }
}
// Send message to server

//  void _sendMessage() {
//     _channel.sink.add("Hello from flutter app!");
//   }
