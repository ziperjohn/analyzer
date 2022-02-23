import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final String port = "8082";
  final String url = "ws://localhost:";

  final webSocketStream = WebSocketChannel.connect(Uri.parse("ws://localhost:8082")).stream;
}
