// teacher_remote_data_source.dart

import '../../core/error/exceptions.dart';
import '../models/teacher_model.dart';

abstract class TeacherRemoteDataSource {
  /// Fetches a list of teachers from local storage
  /// Throws [ServerException] if fetching fails
  Future<List<TeacherModel>> getTeachers();
}

class TeacherRemoteDataSourceImpl implements TeacherRemoteDataSource {
  final List<Map<String, String>> mockTeachers = [
    {
      'name': 'Ahmed Ali',
      'subject': 'Math',
      'experience': '5 years',
      'certificate': 'B.Sc in Mathematics',
    },
    {
      'name': 'Sara Mohamed',
      'subject': 'Physics',
      'experience': '3 years',
      'certificate': 'M.Sc in Physics',
    },
  ];

  @override
  Future<List<TeacherModel>> getTeachers() async {
    try {
      return mockTeachers
          .map((teacher) => TeacherModel.fromMap(teacher))
          .toList();
    } catch (_) {
      throw ServerException();
    }
  }
}
