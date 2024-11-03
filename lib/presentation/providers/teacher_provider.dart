// teacher_provider.dart

import 'package:flutter/material.dart';

import '../../domain/entities/teacher.dart';

class TeacherProvider with ChangeNotifier {
  List<Teacher> teachers = [
    Teacher(
      name: "أحمد علي",
      certificate: "بكالوريوس في الرياضيات",
      subject: "الرياضيات",
      experience: "5 سنوات",
      imageUrl:
          "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg", // صورة معلم
    ),
    Teacher(
      name: "سارة محمد",
      certificate: "ماجستير في الفيزياء",
      subject: "الفيزياء",
      experience: "3 سنوات",
      imageUrl:
          "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg", // صورة معلمة
    ),
    Teacher(
      name: "خالد حسن",
      certificate: "بكالوريوس في الكيمياء",
      subject: "الكيمياء",
      experience: "7 سنوات",
      imageUrl:
          "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg", // صورة معلم
    ),
    Teacher(
      name: "منى عبد الله",
      certificate: "ماجستير في الأحياء",
      subject: "الأحياء",
      experience: "6 سنوات",
      imageUrl:
          "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg", // صورة معلمة
    ),
    // المزيد من المدرسين
  ];
}
