// chat_usecase.dart

import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/chat_message.dart';
import '../repositories/chat_repository.dart';

/// Use case for chat functionalities, including sending and retrieving messages
class ChatUseCase {
  final ChatRepository repository;

  ChatUseCase(this.repository);

  /// Sends a message to another user
  /// Returns [Failure] if unsuccessful, or void if successful
  Future<Either<Failure, void>> sendMessage(ChatMessage message) async {
    return await repository.sendMessage(message);
  }

  /// Retrieves messages between two users
  /// Returns [Failure] if unsuccessful, or List<ChatMessage> if successful
  Future<Either<Failure, List<ChatMessage>>> getMessages(
      String senderId, String receiverId) async {
    return await repository.getMessages(senderId, receiverId);
  }
}
