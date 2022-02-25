import 'package:analyzer_app/models/port_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class WebSocketService {
  final webSocketServer = WebSocketChannel.connect(Uri.parse('ws://localhost:8082'));

  Stream<List<PortModel>> portListStream() {
    return webSocketServer.stream.map((response) {
      List<PortModel> portList = [];

      var parsed = jsonDecode(response);
      var list = parsed["portList"] as List<dynamic>;

      for (var item in list) {
        portList.add(PortModel.fromJson(item));
      }

      return portList;
    });
  }

  void closeStream() {
    webSocketServer.sink.close();
  }
}




// Send message to server

//  void _sendMessage() {
//     _channel.sink.add("Hello from flutter app!");
//   }
