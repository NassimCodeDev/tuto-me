// teacher_repository_impl.dart

import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../domain/repositories/teacher_repository.dart';
import '../datasources/teacher_remote_data_source.dart';
import '../models/teacher_model.dart';

class TeacherRepositoryImpl implements TeacherRepository {
  final TeacherRemoteDataSource remoteDataSource;

  TeacherRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<TeacherModel>>> getTeachers() async {
    try {
      final teachers = await remoteDataSource.getTeachers();
      return Right(teachers); // Success returns list of teachers
    } catch (e) {
      return Left(ServerFailure()); // Failure if fetching teachers fails
    }
  }
}
