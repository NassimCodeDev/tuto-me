// chat_message.dart

import 'package:equatable/equatable.dart';

/// Entity representing a chat message
class ChatMessage extends Equatable {
  final String senderId;
  final String receiverId;
  final String content;
  final DateTime timestamp;

  const ChatMessage({
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [senderId, receiverId, content, timestamp];
}
