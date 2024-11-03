import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/chat_message.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const MessageBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMe = message.senderId == 'studentId'; // تحديد مرسل الرسالة
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: BubbleSpecialThree(
        text: message.content,
        color: isMe ? Colors.white : Colors.grey[300]!,
        isSender: isMe,
        tail: true,
        textStyle: GoogleFonts.cairo(
          color: isMe ? Colors.black : Colors.black87,
          fontSize: 13,
        ),
      ),
    );
  }
}
