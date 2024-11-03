// auth_repository_impl.dart

import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    try {
      await remoteDataSource.login(email, password);
      return Right(null); // Success without a return value
    } catch (e) {
      return Left(
          AuthFailure("Login failed: ${e.toString()}")); // Returning failure
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      return Right(null); // Success without a return value
    } catch (e) {
      return Left(ServerFailure()); // Returning failure if logout fails
    }
  }

  @override
  Future<Either<Failure, bool>> isAuthenticated() async {
    try {
      final result = await remoteDataSource.isAuthenticated();
      return Right(result); // Returning authentication status
    } catch (e) {
      return Left(ServerFailure()); // Returning failure if check fails
    }
  }
}
