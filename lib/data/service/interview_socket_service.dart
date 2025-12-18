import 'dart:convert';
import 'package:career_coach/data/local/local_cache.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

typedef OnMessageCallback = void Function(Map<String, dynamic> data);
typedef OnTypingCallback = void Function();

class InterviewSocketService {
  StompClient? _client;

  bool get isConnected => _client?.connected ?? false;

  void connect({required int sessionId, required OnMessageCallback onMessage}) async {
    final accessToken = await LocalCache.getString(StringCache.accessToken);

    _client = StompClient(
      config: StompConfig(
        useSockJS: true,
        url: 'https://career-be.notarget.id.vn/ws',
        stompConnectHeaders: {'Authorization': 'Bearer $accessToken'},
        webSocketConnectHeaders: {'Authorization': 'Bearer $accessToken'},
        onConnect: (StompFrame frame) {
          _client!.subscribe(
            destination: '/topic/interview/$sessionId',
            callback: (frame) {
              if (frame.body != null) {
                onMessage(jsonDecode(frame.body!));
              }
            },
          );

          _client!.subscribe(
            destination: '/topic/interview/$sessionId/typing',
            callback: (frame) {
              if (frame.body != null) {}
            },
          );
        },
        onWebSocketError: (error) {},
        onStompError: (frame) {},
      ),
    );

    _client!.activate();
  }

  void sendMessage({required int sessionId, required String content, String? sender}) async {
    if (!isConnected) return;

    final body = {'type': 'CHAT', 'content': content, 'sender': sender, 'timestamp': DateTime.now().toUtc().toIso8601String()};

    _client!.send(
      destination: '/app/interview/$sessionId/send',
      body: jsonEncode(body),
    );
  }

  void disconnect() {
    _client?.deactivate();
    _client = null;
  }
}
