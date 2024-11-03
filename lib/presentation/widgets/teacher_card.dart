import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tutor_me/presentation/pages/chat_page.dart';

import '../../domain/entities/teacher.dart';
import '../providers/card_flip_provider.dart';

class TeacherCard extends StatefulWidget {
  final Teacher teacher;
  final int index;

  const TeacherCard({Key? key, required this.teacher, required this.index})
      : super(key: key);

  @override
  _TeacherCardState createState() => _TeacherCardState();
}

class _TeacherCardState extends State<TeacherCard> {
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final cardFlipProvider =
        Provider.of<CardFlipProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (cardFlipProvider.activeCardIndex == widget.index &&
          cardKey.currentState != null &&
          cardKey.currentState!.isFront) {
        cardKey.currentState!.toggleCard();
      } else if (cardFlipProvider.activeCardIndex != widget.index &&
          cardKey.currentState != null &&
          !cardKey.currentState!.isFront) {
        cardKey.currentState!.toggleCard();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cardFlipProvider = Provider.of<CardFlipProvider>(context);

    return GestureDetector(
      onTap: () {
        cardFlipProvider.flipCard(widget.index);
      },
      child: FlipCard(
        key: cardKey,
        flipOnTouch: false,
        direction: FlipDirection.HORIZONTAL,
        front: _buildFrontCard(context),
        back: _buildBackCard(context),
      ),
    );
  }

  Widget _buildFrontCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
            child: Image.network(
              widget.teacher.imageUrl,
              height: 140, // تكبير مساحة الصورة
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Flexible(
            // لإجبار النصوص على التكيف مع المساحة المتاحة
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.teacher.name,
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "التخصص: ${widget.teacher.subject}",
                    style: GoogleFonts.cairo(
                      fontSize: 10,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "الشهادة: ${widget.teacher.certificate}",
                    style: GoogleFonts.cairo(
                      fontSize: 10,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatPage(
                    teacher: widget.teacher))); // فتح صفحة الشات عند الضغط
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 0,
        child: Center(
          child: Icon(
            Icons.mail_outline,
            color: Colors.blueAccent,
            size: 36,
          ),
        ),
      ),
    );
  }
}
