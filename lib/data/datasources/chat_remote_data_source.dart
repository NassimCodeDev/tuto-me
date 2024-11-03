// chat_remote_data_source.dart

import '../../domain/entities/chat_message.dart';

abstract class ChatRemoteDataSource {
  Future<void> sendMessage(ChatMessage message);
  Future<List<ChatMessage>> getMessages(String senderId, String receiverId);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  @override
  Future<void> sendMessage(ChatMessage message) async {
    // منطق إرسال الرسالة، هنا يمكنك استخدام بيانات وهمية أو قاعدة بيانات محلية
  }

  @override
  Future<List<ChatMessage>> getMessages(
      String senderId, String receiverId) async {
    // منطق جلب الرسائل، يمكنك إرجاع بيانات وهمية للاختبار
    return [];
  }
}
