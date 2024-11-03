// teacher.dart

import 'package:equatable/equatable.dart';

/// Entity representing a teacher within the application
class Teacher extends Equatable {
  final String name;
  final String subject;
  final String experience;
  final String certificate;
  final String imageUrl;
  final bool isOnline;

  const Teacher({
    required this.name,
    required this.subject,
    required this.experience,
    required this.certificate,
    required this.imageUrl,
    this.isOnline = false,
  });

  @override
  List<Object?> get props =>
      [name, subject, experience, certificate, imageUrl, isOnline];
}
