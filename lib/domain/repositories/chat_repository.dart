// chat_repository.dart

import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/chat_message.dart';

/// ChatRepository interface to handle chat functionalities
abstract class ChatRepository {
  /// Sends a message from one user to another
  /// Returns [Failure] if unsuccessful, or void if successful
  Future<Either<Failure, void>> sendMessage(ChatMessage message);

  /// Retrieves messages exchanged between two users
  /// Returns [Failure] if unsuccessful, or List<ChatMessage> if successful
  Future<Either<Failure, List<ChatMessage>>> getMessages(
      String senderId, String receiverId);
}
