// chat_provider.dart

import 'package:flutter/material.dart';

import '../../domain/entities/chat_message.dart';
import '../../domain/usecases/chat_usecase.dart';

class ChatProvider with ChangeNotifier {
  final ChatUseCase chatUseCase;
  List<ChatMessage> messages = [];

  ChatProvider(this.chatUseCase);

  Future<void> sendMessage(ChatMessage message) async {
    final result = await chatUseCase.sendMessage(message);
    result.fold(
      (failure) => print('Failed to send message'),
      (_) {
        messages.add(message);
        notifyListeners();
      },
    );
  }

  Future<void> getMessages(String senderId, String receiverId) async {
    final result = await chatUseCase.getMessages(senderId, receiverId);
    result.fold(
      (failure) => print('Failed to load messages'),
      (data) {
        messages = data;
        notifyListeners();
      },
    );
  }
}
