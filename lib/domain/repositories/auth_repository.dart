// auth_repository.dart

import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';

/// AuthRepository interface to handle user authentication actions
abstract class AuthRepository {
  /// Logs in a user with email and password
  /// Returns [Failure] if unsuccessful, or void if successful
  Future<Either<Failure, void>> login(String email, String password);

  /// Logs out the currently authenticated user
  /// Returns [Failure] if unsuccessful, or void if successful
  Future<Either<Failure, void>> logout();

  /// Checks if a user is currently authenticated
  /// Returns [Failure] if unsuccessful, or bool indicating authentication status
  Future<Either<Failure, bool>> isAuthenticated();
}
