import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/teacher_provider.dart';
import '../widgets/teacher_card.dart';

class TeachersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final teacherProvider = Provider.of<TeacherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'المدرسين',
          style: GoogleFonts.cairo(),
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.75,
            ),
            itemCount: teacherProvider.teachers.length,
            itemBuilder: (context, index) {
              return TeacherCard(
                teacher: teacherProvider.teachers[index],
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }
}
