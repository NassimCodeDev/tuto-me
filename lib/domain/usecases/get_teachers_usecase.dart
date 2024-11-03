// get_teachers_usecase.dart

import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/teacher.dart';
import '../repositories/teacher_repository.dart';

/// Use case for fetching a list of teachers
class GetTeachersUseCase {
  final TeacherRepository repository;

  GetTeachersUseCase(this.repository);

  /// Executes the getTeachers operation
  /// Returns [Failure] if unsuccessful, or List<Teacher> if successful
  Future<Either<Failure, List<Teacher>>> call() async {
    return await repository.getTeachers();
  }
}
