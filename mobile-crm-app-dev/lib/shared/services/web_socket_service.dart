import 'dart:async';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketService extends GetxService {
  Future<IOWebSocketChannel> init(String url) async {
    final channel = IOWebSocketChannel.connect(
      Uri.parse(url),
      pingInterval: const Duration(seconds: 10),
    );
    return channel;
  }
}
