// logout_usecase.dart

import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

/// Use case for logging out the user
class LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  /// Executes the logout operation
  /// Returns [Failure] if unsuccessful, or void if successful
  Future<Either<Failure, void>> call() async {
    return await repository.logout();
  }
}
