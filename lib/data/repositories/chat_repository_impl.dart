// chat_repository_impl.dart

import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_remote_data_source.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> sendMessage(ChatMessage message) async {
    try {
      await remoteDataSource.sendMessage(message);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ChatMessage>>> getMessages(
      String senderId, String receiverId) async {
    try {
      final messages = await remoteDataSource.getMessages(senderId, receiverId);
      return Right(messages);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
