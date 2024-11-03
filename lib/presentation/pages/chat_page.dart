import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/chat_message.dart';
import '../../domain/entities/teacher.dart';
import '../providers/chat_provider.dart';
import '../widgets/message_bubble.dart';

class ChatPage extends StatelessWidget {
  final TextEditingController messageController = TextEditingController();
  final Teacher teacher;

  ChatPage({Key? key, required this.teacher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    final scrollController = ScrollController();

    // الانتقال إلى آخر رسالة بعد إرسال رسالة جديدة
    void _scrollToBottom() {
      Future.delayed(Duration(milliseconds: 300), () {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.black87, // لون الشريط العلوي أسود ناعم
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(teacher.imageUrl),
                    radius: 20,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor:
                            teacher.isOnline ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              Text(
                teacher.name,
                style: GoogleFonts.cairo(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                padding: EdgeInsets.all(10),
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  return MessageBubble(
                    message: chatProvider.messages[index],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        controller: messageController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: GoogleFonts.cairo(),
                        decoration: InputDecoration(
                          hintText: 'اكتب رسالتك هنا...',
                          hintStyle: GoogleFonts.cairo(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      final message = ChatMessage(
                        senderId: 'studentId',
                        receiverId: 'teacherId',
                        content: messageController.text,
                        timestamp: DateTime.now(),
                      );
                      chatProvider.sendMessage(message);
                      messageController.clear();
                      _scrollToBottom(); // الانتقال إلى آخر رسالة
                    },
                    icon: Icon(Icons.send, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
