// teacher_repository.dart

import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/teacher.dart';

/// TeacherRepository interface to handle teacher data actions
abstract class TeacherRepository {
  /// Fetches a list of teachers
  /// Returns [Failure] if unsuccessful, or List<Teacher> if successful
  Future<Either<Failure, List<Teacher>>> getTeachers();
}
