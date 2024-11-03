// teacher_model.dart

import '../../domain/entities/teacher.dart';

/// TeacherModel is a data model representing teacher's information
class TeacherModel extends Teacher {
  TeacherModel({
    required String name,
    required String subject,
    required String experience,
    required String certificate,
    required String imageUrl,
  }) : super(
          name: name,
          subject: subject,
          experience: experience,
          certificate: certificate,
          imageUrl: imageUrl,
        );

  /// Creates a TeacherModel from a Map
  factory TeacherModel.fromMap(Map<String, dynamic> map) {
    return TeacherModel(
      name: map['name'] ?? '',
      subject: map['subject'] ?? '',
      experience: map['experience'] ?? '',
      certificate: map['certificate'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  /// Converts TeacherModel to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'subject': subject,
      'experience': experience,
      'certificate': certificate,
    };
  }
}
