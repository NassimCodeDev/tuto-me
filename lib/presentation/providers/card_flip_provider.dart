import 'package:flutter/material.dart';

class CardFlipProvider with ChangeNotifier {
  int? _activeCardIndex;

  int? get activeCardIndex => _activeCardIndex;

  void flipCard(int index) {
    if (_activeCardIndex == index) {
      // إذا كانت البطاقة الحالية مفعلة بالفعل، قم بإعادتها للوجه الأول
      _activeCardIndex = null;
    } else {
      // تعيين البطاقة النشطة
      _activeCardIndex = index;
    }
    notifyListeners(); // إرسال تنبيه لتحديث الواجهة
  }
}
